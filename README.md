# Demonstrate Node.js 25650 Bug

In Node.js 11.7.0, a bug was introduced that results in the following command:

`npm t`

Outputting an empty coverage report. In older versions of Node.js, a correct
100% coverage report is output.

The underlying cause appears to be that the registered exit handler in `nyc`
no longer fires:

```js
onExit(function () {
  _this.writeCoverageFile()
}, {alwaysLast: true})
```

☝ mocha has its own exit handler, one hunch is perhaps two exit handlers
being run in conjunction no longer works.
