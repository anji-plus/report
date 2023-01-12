export function setAssChartData(widgets, options) {
  const selectOptions = options.filter(item => item.uuid).map(item => {
    return {
      code: item.uuid,
      name: item.label
    }
  })
  widgets.forEach(item => {
    const setup = item['options']['setup']
    console.log(setup)
    setup.forEach(sItem => {
      if (sItem.name == 'assChart') {
        sItem['selectOptions'] = selectOptions
      }
    })
  })
}