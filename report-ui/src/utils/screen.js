import { eventBus } from "@/utils/eventBus";

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

export function eventBusParams(optionsSetup, optionsData, callback) {
  eventBus.$on("eventParams", (formParams) => {
    const uuid = optionsSetup.uuid;
    if (formParams.assChart.includes(uuid)) {
      const contextData = optionsData.dynamicData.contextData;
      for (const key in contextData) {
        if (formParams.hasOwnProperty(key)) {
          contextData[key] = formParams[key];
        }
      }
      callback(optionsData.dynamicData, optionsSetup)
    }
  });
}
