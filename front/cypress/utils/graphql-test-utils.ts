interface GraphqlRequest extends Object {
  body: {
    operationName: string
  }
  alias: string
}

export const hasOperationName = (req: GraphqlRequest, operationName: string) => {
  const { body } = req

  return (
    body.hasOwnProperty('operationName') && body.operationName === operationName
  )
}

/**
 * operationNameと一致した場合、クエリのエイリアスを返す
 */
export const aliasQuery = (req: GraphqlRequest, operationName: string) => {
  if (hasOperationName(req, operationName)) {
    req.alias = `gql${operationName}Query`
  }
}

/**
 * operationNameと一致した場合、ミューテーションのエイリアスを返す
 */
export const aliasMutation = (req: GraphqlRequest, operationName: string) => {
  if (hasOperationName(req, operationName)) {
    req.alias = `gql${operationName}Mutation`
  }
}
