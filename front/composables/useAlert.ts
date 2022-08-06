interface inputAlertStatus {
  message: string
  color: 'var(--success-color)' | 'var(--danger-color)' | ''
}

interface alertStatus extends inputAlertStatus {
  visible: 'visible' | 'hidden'
}

export const useAlert = () => {
  const alertStatus = useState<alertStatus>('alertStatus', () => ({
    visible: 'hidden',
    message: '',
    color: 'var(--success-color)'
  }))

  const showAlert = ({ color, message }: inputAlertStatus) => {
    alertStatus.value.message = message
    alertStatus.value.visible = 'visible'
    alertStatus.value.color = color
    setTimeout(hideAlert, 3000)
  }

  const hideAlert = () => {
    alertStatus.value.message = ''
    alertStatus.value.visible = 'hidden'
    alertStatus.value.color = ''
  }

  return {
    alertStatus: readonly(alertStatus),
    showAlert,
    hideAlert
  }
}
