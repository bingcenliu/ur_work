
"use strict";

let MasterboardDataMsg = require('./MasterboardDataMsg.js');
let RobotStateRTMsg = require('./RobotStateRTMsg.js');
let Digital = require('./Digital.js');
let RobotModeDataMsg = require('./RobotModeDataMsg.js');
let Analog = require('./Analog.js');
let ToolDataMsg = require('./ToolDataMsg.js');
let IOStates = require('./IOStates.js');

module.exports = {
  MasterboardDataMsg: MasterboardDataMsg,
  RobotStateRTMsg: RobotStateRTMsg,
  Digital: Digital,
  RobotModeDataMsg: RobotModeDataMsg,
  Analog: Analog,
  ToolDataMsg: ToolDataMsg,
  IOStates: IOStates,
};
