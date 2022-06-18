import { CurrentUserQuery, Auth, LoginMutation } from "#build/gql-sdk";
import { gqlErrorHandling } from "~~/graphql";

const JWT_COOKIE_NAME = "prum_person_portfolio_jwt";

export const useCurrentUser = () => {
  const currentUser = useState<CurrentUserQuery["currentUser"] | null>("current_user");

  const login = async ({ email, password }: Auth) => {
    const { showAlert } = useAlert();
    try {
      const { login } = (await GqlLogin({ email, password })) as LoginMutation;

      if (login == null) throw new Error();

      currentUser.value = login.user;

      const cookies = useCookie(JWT_COOKIE_NAME, { path: '/' });
      cookies.value = login.jwt;

      navigateTo(`/users/${login.user.id}/edit`);
      showAlert({ message: "ログインしました", color: "var(--success-color)" });
    } catch (e) {
      gqlErrorHandling(e);
    }
  };

  /**
   * SSR時にリクエストヘッダーからjwtを取得し、現在のユーザーをフェッチする
   */
  const ssrUserInit = async () => {
    // リクエストヘッダーからクッキー全体を取り出す
    const { cookie } = useRequestHeaders(['cookie']);

    // キーバリューが = で繋がったjwt文字列
    const jwtKeyValue = cookie.split('; ').find(keyValue => keyValue.includes(JWT_COOKIE_NAME))

    // = から左の全文字を削除し、jwtのみ抜き出す
    const jwt = jwtKeyValue?.replace(`${JWT_COOKIE_NAME}=`, "")

    if (!jwt) return;

    useGqlToken(jwt);

    try {
      const res = (await GqlCurrentUser()) as CurrentUserQuery;

      if (res.currentUser == null) throw new Error();

      currentUser.value = res.currentUser;
    } catch (e) {
      gqlErrorHandling(e);
    }
  };

  const logout = () => {
    currentUser.value = null
    const cookie = useCookie(JWT_COOKIE_NAME, { path: '/' })
    cookie.value = ''
    navigateTo('/')
    const { showAlert } = useAlert()
    showAlert({ message: 'ログアウトしました', color: 'var(--success-color)' })
  }

  return {
    currentUser: readonly(currentUser),
    login,
    ssrUserInit,
    logout
  };
};
