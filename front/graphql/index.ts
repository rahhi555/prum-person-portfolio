import { useAlert } from '~/composables/useAlert'

export interface GraphqlError {
  response: {
    errors: { message: string }[];
  };
}

const isGraphqlError = (e: unknown): e is GraphqlError => {
  return (e as GraphqlError).response?.errors !== undefined;
};

/**
 * cacheしたエラーがGraphQL規定のものと一致していれば、格納されているエラーメッセージを表示する。
 * そうでなければ、汎用エラーメッセージを表示する。
 * @param e - cache(e)のe 
 */
export const gqlErrorHandling = (e: unknown) => {
  const message = isGraphqlError(e) ? e.response.errors[0].message : "不明なエラーが発生しました";

  const { showAlert } = useAlert()
  showAlert({ message, color: 'var(--danger-color)' });
}
