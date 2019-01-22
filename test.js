const {equal} = require('assert')
const lib = require('./')

// see: https://github.com/nodejs/node/issues/25650
describe('demonstrate bug', () => {
  it('should have 100% coverage', () => {
    equal(lib.hello, 'world')
  })
})
