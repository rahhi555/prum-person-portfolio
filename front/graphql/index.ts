export interface GraphqlError {
  response: {
    errors: { message: string }[];
  };
}

export const isGraphqlError = (e: unknown): e is GraphqlError => {
  return (e as GraphqlError).response?.errors !== undefined;
};
