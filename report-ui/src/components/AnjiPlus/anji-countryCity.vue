<template>
  <el-cascader v-model="selectValue" style="width: 100%" :props="{ lazy: true, lazyLoad: lazyLoad, label: 'text', value: 'id' }" :options="countryCity" />
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  props: {
    value: null,
  },
  computed: {
    ...mapGetters(['countryCity']),
    selectValue: {
      get: function() {
        return [...this.value]
      },
      set: function(val) {
        this.$emit('update:value', val)
      },
    },
  },
  mounted() {
    if (this.value && this.value.length > 0) {
      this.initCity()
    } else {
      this.$store.dispatch('dict/add_countryCity', { level: 0 })
    }
  },
  methods: {
    getCityName() {
      const value = this.selectValue
      const country = this.countryCity.find((item) => item.id === value[0])
      const province = country.children.find((item) => item.id === value[1])
      const city = province.children.find((item) => item.id === value[2])
      const region = city.children.find((item) => item.id === value[3])
      return [country.text, province.text, city.text, region.text]
    },
    //   初始化数据
    initCity() {
      const value = this.value
      // console.log(value)
      if (!value) {
        return
      }
      const country = this.countryCity.find((item) => item.id === value[0])
      console.log(country)
      if (!country || !country.children) {
        this.getData().then((list) => {
          this.getData({ country: value[0], level: 1 }).then((list) => {
            this.getData({ country: value[0], province: value[1], level: 2 }).then((list) => {
              this.getData({ country: value[0], province: value[1], city: value[2], level: 3, update: true }).then((list) => {})
            })
          })
        })
      } else {
        const province = country.children.find((item) => item.id === value[1])
        if (!province || !province.children) {
          this.getData({ country: value[0], level: 1 }).then((list) => {
            this.getData({ country: value[0], province: value[1], level: 2 }).then((list) => {
              this.getData({ country: value[0], province: value[1], city: value[2], level: 3, update: true }).then((list) => {})
            })
          })
        } else {
          const city = province.children.find((item) => item.id === value[2])
          if (!city || !city.children) {
            this.getData({ country: value[0], province: value[1], level: 2 }).then((list) => {
              this.getData({ country: value[0], province: value[1], city: value[2], level: 3, update: true }).then((list) => {})
            })
          } else {
            const region = city.children.find((item) => item.id === value[3])
            if (!region) {
              this.getData({ country: value[0], province: value[1], city: value[2], level: 3, update: true }).then((list) => {})
            }
          }
        }
      }
    },
    getData(params) {
      return this.$store.dispatch('dict/add_countryCity', params)
    },
    lazyLoad(node, resolve) {
      console.log(node)
      const { level, path, data } = node
      if (data && data.children) {
        resolve(data.children)
      } else {
        if (level === 0) {
          return
        }
        const params = { country: path[0], province: path[1], city: path[2], level }
        this.$store.dispatch('dict/add_countryCity', params).then((list) => resolve(list))
      }
    },
  },
}
</script>
