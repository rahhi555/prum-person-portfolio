import type { CurrentUserQuery, Auth } from "#build/gql-sdk";
import { gqlErrorHandling } from "~~/graphql";

const JWT_COOKIE_NAME = "prum_person_portfolio_jwt";

export const useCurrentUser = () => {
  /**
   * ログイン中のユーザー
   */
  const currentUser = useState<CurrentUserQuery["currentUser"] | null>("current_user");

  /**
   * api認証に必要なjwt
   */
  const jwt = useState<string | null>("json_web_token");

  /**
   * ログイン
   */
  const login = async ({ email, password }: Auth) => {
    const { showAlert } = useAlert();
    try {
      const { login } = await GqlLogin({ email, password })

      if (login == null) throw new Error();

      currentUser.value = login.user;
      jwt.value = login.jwt;

      const cookies = useCookie(JWT_COOKIE_NAME, { path: "/" });
      cookies.value = login.jwt;

      useGqlToken(jwt.value);

      navigateTo('/');
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
    const { cookie } = useRequestHeaders(["cookie"]);
    
    // キーバリューが = で繋がったjwt文字列
    let cookieJwt = cookie?.split("; ")?.find((keyValue) => keyValue.includes(JWT_COOKIE_NAME));

    // = から左の全文字を削除し、jwtのみ抜き出す
    cookieJwt = cookieJwt?.replace(`${JWT_COOKIE_NAME}=`, "");

    if (!cookieJwt) return;

    jwt.value = cookieJwt;
    useGqlToken(cookieJwt);

    try {
      const res = await GqlCurrentUser();

      if (res.currentUser == null) throw new Error();

      currentUser.value = res.currentUser;
    } catch (e) {
      gqlErrorHandling(e);
    }
  };

  /**
   * ログアウト
   */
  const logout = () => {
    currentUser.value = null;
    jwt.value = null;

    useGqlToken("");

    const cookie = useCookie(JWT_COOKIE_NAME, { path: "/" });
    cookie.value = "";
    navigateTo("/");
    const { showAlert } = useAlert();
    showAlert({ message: "ログアウトしました", color: "var(--success-color)" });
  };

  /**
   * currentUser更新
   */
  const updateCurrentUser = async (user: CurrentUserQuery['currentUser']) => {
    const { showAlert } = useAlert()
    let message 

    if (currentUser == null) message = "ログインしていません"
    if (currentUser.value?.id !== user.id ) message = "異なるユーザーの情報が更新されようとしました"

    if (!!message) { 
      showAlert({ message, color: 'var(--danger-color)' }) 
      return
    }

    currentUser.value = user
    message = 'ユーザー情報を更新しました'
    showAlert({ message, color: 'var(--success-color)' })
  }

  return {
    currentUser: readonly(currentUser),
    jwt: readonly(jwt),
    login,
    ssrUserInit,
    logout,
    updateCurrentUser
  };
};
