<script setup lang="ts">
// chart.jsを分割代入する方式だと以下のようなエラーが出る
// Named export 'BarElement' not found. The requested module 'chart.js' is a CommonJS module,
// which may not support all module.exports as named exports.
import 'chart.js/auto'
import { Bar } from 'vue-chartjs'
import type { TChartData, TChartOptions } from 'vue-chartjs/dist/types'

export type Props = {
  chartId?: string,
  datasetIdKey?: string,
  width?: number,
  height?: number,
  cssClasses?: string,
  styles?: Partial<CSSStyleDeclaration>,
  chartData: TChartData<'bar'>,
}

withDefaults(defineProps<Props>(), {
  chartId: 'bar-chart',
  datasetIdKey: 'lebel',
  width: 1000,
  height: 500,
  cssClasses: '',
  styles: undefined,
  plugins: undefined
})

const chartOptions: TChartOptions<'bar'> = {
  skipNull: true,
  scales: {
    y: {
      min: 0,
      max: 100
    }
  }
}
</script>

<template>
  <Bar
    :chart-options="chartOptions"
    :chart-data="chartData"
    :chart-id="chartId"
    :dataset-id-key="datasetIdKey"
    :css-classes="cssClasses"
    :styles="styles"
    :width="width"
    :height="height"
  />
</template>