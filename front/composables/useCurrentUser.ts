import { CurrentUserQuery, Auth, LoginMutation } from "#build/gql-sdk";
import { isGraphqlError } from "~~/graphql";

export const useCurrentUser = () => {
  const currentUser = useState<CurrentUserQuery["currentUser"]>("current_user");

  const login = async ({ email, password }: Auth) => {
    const { showAlert } = useAlert();
    try {
      const { login } = (await GqlLogin({ email, password })) as LoginMutation;

      if (login == null) throw new Error

      currentUser.value = login.user
      navigateTo(`/users/${login.user.id}/edit`)
      showAlert({ message: 'ログインしました', color: 'var(--success-color)' })
    } catch (e) {
      const message = isGraphqlError(e) ? e.response.errors[0].message : "不明なエラーが発生しました";
      showAlert({ message, color: 'var(--danger-color)' });
    }
  };

  return {
    login,
    currentUser: readonly(currentUser),
  };
};
