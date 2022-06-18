<template>
  <div>
    <p>
      <NuxtLink to="/users/1/edit">hoge</NuxtLink>
    </p>
    <p @click="GqlCurrentUser">currentUser</p>
  </div>
</template>
