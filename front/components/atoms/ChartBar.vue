<script setup lang="ts">
import { Bar } from 'vue-chartjs'
import type { TChartData, TChartOptions } from 'vue-chartjs/dist/types'
import{ Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, Plugin } from 'chart.js'

export type Props = {
  chartId?: string,
  datasetIdKey?: string,
  width?: number,
  height?: number,
  cssClasses?: string,
  styles?: Partial<CSSStyleDeclaration>,
  plugins?: Plugin<'bar'>[],
  chartData: TChartData<'bar'>,
}

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

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
    :plugins="plugins"
    :css-classes="cssClasses"
    :styles="styles"
    :width="width"
    :height="height"
  />
</template>