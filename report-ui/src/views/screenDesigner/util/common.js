export const converArr = (data) => {
  let tempArr = [], newArr = []
  for (let i = 0; i < data.length; i++) {
    const item = data[i]
    if (tempArr.indexOf(item.type) === -1) {
      newArr.push({
        name: item.tabName,
        type: item.type,
        list: [item]
      })
      tempArr.push(item.type);
    } else {
      for (let j = 0; j < newArr.length; j++) {
        if (newArr[j].type == item.type) {
          newArr[j].list.push(item)
        }
      }
    }
  }
  return newArr
}
