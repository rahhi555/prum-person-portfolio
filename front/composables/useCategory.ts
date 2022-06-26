import type { CategoriesQuery } from "#build/gql-sdk"

export const useCategory = () => {
  const categories = useState<CategoriesQuery['categories']>("categories")

  const fetchCategories = async () => {
    const { categories: result } = await GqlCategories()
    if(categories == null) return
    categories.value = result
  }


  return {
    categories: readonly(categories),
    fetchCategories
  }
}