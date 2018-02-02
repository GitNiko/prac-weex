__d(/* example/src/index.js */function(global, require, module, exports) {var _jsxFileName = "/Users/niko/workspace/react-native-split/example/src/index.js";

var _react = require("react/react.js"); // 187 = react

var _react2 = babelHelpers.interopRequireDefault(_react);

var _reactNative = require("react-native-implementation"); // 12 = react-native

var RequestCode = String(Math.random());

var Icon = function (_React$Component) {
  babelHelpers.inherits(Icon, _React$Component);

  function Icon() {
    babelHelpers.classCallCheck(this, Icon);
    return babelHelpers.possibleConstructorReturn(this, (Icon.__proto__ || Object.getPrototypeOf(Icon)).apply(this, arguments));
  }

  babelHelpers.createClass(Icon, [{
    key: "render",
    value: function render() {
      var _props = this.props,
          type = _props.type,
          size = _props.size,
          color = _props.color,
          style = _props.style;

      var unicode = "\uE6F1";

      var iconStyle = {};
      if (size) {
        iconStyle.fontSize = size;
      }
      if (color) {
        iconStyle.color = color;
      }
      return _react2.default.createElement(
        _reactNative.Text,
        { style: [style, styles.icon, iconStyle], __source: {
            fileName: _jsxFileName,
            lineNumber: 27
          }
        },
        unicode
      );
    }
  }]);
  return Icon;
}(_react2.default.Component);

var RNHighScores = function (_React$Component2) {
  babelHelpers.inherits(RNHighScores, _React$Component2);

  function RNHighScores() {
    var _ref;

    var _temp, _this2, _ret;

    babelHelpers.classCallCheck(this, RNHighScores);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this2 = babelHelpers.possibleConstructorReturn(this, (_ref = RNHighScores.__proto__ || Object.getPrototypeOf(RNHighScores)).call.apply(_ref, [this].concat(args))), _this2), _this2.state = {
      intent: ""
    }, _this2.onChange = function (nextState) {
      console.log("nextState", nextState);
    }, _this2.onResult2 = function (result) {
      console.log("onResult2:", result);
    }, _this2.onResult = function (result) {
      console.log("onResult1", result);
      console.log(RequestCode);
      if (result === RequestCode) {
        _this2.setState({
          intent: result.requestCode
        });
      }
    }, _this2.back = function () {
      console.log(_reactNative.NativeModules.Navigation);
      _reactNative.NativeModules.Navigation.setResult({ sd: "sdsd" });
    }, _this2.openUri = function () {
      _reactNative.NativeModules.Navigation.openUri({
        uri: "http://192.168.31.108:8081/index.ios.bundle?platform=ios&dev=true",
        data: {
          username: "jack"
        }
      }).then(function (ok) {
        return console.log(ok);
      }).catch(function (err) {
        return console.log(err);
      });
    }, _this2.pick = function () {}, _this2.registFont = function () {}, _temp), babelHelpers.possibleConstructorReturn(_this2, _ret);
  }

  babelHelpers.createClass(RNHighScores, [{
    key: "componentDidMount",
    value: function componentDidMount() {
      _reactNative.NativeModules.Navigation.getIntent().then(function (intent) {
        return console.log("intent", intent);
      });
    }
  }, {
    key: "componentWillUnmount",
    value: function componentWillUnmount() {
      console.log("will unmount");
      this.subscription.remove();
    }
  }, {
    key: "render",
    value: function render() {
      return _react2.default.createElement(
        _reactNative.View,
        { style: styles.container, __source: {
            fileName: _jsxFileName,
            lineNumber: 82
          }
        },
        _react2.default.createElement(
          _reactNative.Text,
          {
            __source: {
              fileName: _jsxFileName,
              lineNumber: 83
            }
          },
          "\u56DE\u5E26\u503C:",
          this.state.intent
        ),
        _react2.default.createElement(
          _reactNative.Text,
          {
            __source: {
              fileName: _jsxFileName,
              lineNumber: 84
            }
          },
          RequestCode
        ),
        _react2.default.createElement(
          _reactNative.TouchableHighlight,
          { onPress: this.openUri, __source: {
              fileName: _jsxFileName,
              lineNumber: 85
            }
          },
          _react2.default.createElement(
            _reactNative.Text,
            {
              __source: {
                fileName: _jsxFileName,
                lineNumber: 86
              }
            },
            "openUri"
          )
        ),
        _react2.default.createElement(
          _reactNative.TouchableHighlight,
          { onPress: this.back, __source: {
              fileName: _jsxFileName,
              lineNumber: 88
            }
          },
          _react2.default.createElement(
            _reactNative.Text,
            {
              __source: {
                fileName: _jsxFileName,
                lineNumber: 89
              }
            },
            "pop"
          )
        ),
        _react2.default.createElement(
          _reactNative.TouchableHighlight,
          { onPress: this.pick, __source: {
              fileName: _jsxFileName,
              lineNumber: 91
            }
          },
          _react2.default.createElement(
            _reactNative.Text,
            {
              __source: {
                fileName: _jsxFileName,
                lineNumber: 92
              }
            },
            "download"
          )
        ),
        _react2.default.createElement(
          _reactNative.TouchableHighlight,
          { onPress: this.registFont, __source: {
              fileName: _jsxFileName,
              lineNumber: 94
            }
          },
          _react2.default.createElement(
            _reactNative.Text,
            {
              __source: {
                fileName: _jsxFileName,
                lineNumber: 95
              }
            },
            "registFont"
          )
        ),
        _react2.default.createElement(Icon, { size: 32, color: "#e61515", __source: {
            fileName: _jsxFileName,
            lineNumber: 97
          }
        })
      );
    }
  }]);
  return RNHighScores;
}(_react2.default.Component);

var styles = _reactNative.StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFFFFF"
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: "center",
    margin: 10
  },
  scores: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5
  },
  icon: {
    fontSize: 44,
    fontFamily: "iconfont",
    color: "#FFF"
  },
  wrap: {
    justifyContent: "center",
    alignItems: "center"
  },
  cornerTip: {
    position: "absolute",
    right: -7,
    top: -7,
    backgroundColor: "red",
    color: "white",
    borderRadius: 8,
    borderWidth: 1,
    borderColor: "white",
    fontSize: 10,
    textAlign: "center",
    minWidth: 16,
    paddingLeft: 2,
    paddingRight: 2,
    overflow: "hidden",
    lineHeight: 14
  },
  badgeImg: {
    position: "absolute",
    right: 3.5,
    bottom: -3,
    transform: [{ rotateZ: "-45deg" }]
  }
});

_reactNative.AppRegistry.registerComponent("Thrall", function () {
  return RNHighScores;
});
}, "example/src/index.js", null, "example/src/index.js");

require("example/src/index.js");