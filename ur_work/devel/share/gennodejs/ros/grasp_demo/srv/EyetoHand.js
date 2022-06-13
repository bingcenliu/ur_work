// Auto-generated. Do not edit!

// (in-package grasp_demo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class EyetoHandRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.marker_x = null;
      this.marker_y = null;
      this.marker_z = null;
    }
    else {
      if (initObj.hasOwnProperty('marker_x')) {
        this.marker_x = initObj.marker_x
      }
      else {
        this.marker_x = 0.0;
      }
      if (initObj.hasOwnProperty('marker_y')) {
        this.marker_y = initObj.marker_y
      }
      else {
        this.marker_y = 0.0;
      }
      if (initObj.hasOwnProperty('marker_z')) {
        this.marker_z = initObj.marker_z
      }
      else {
        this.marker_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EyetoHandRequest
    // Serialize message field [marker_x]
    bufferOffset = _serializer.float64(obj.marker_x, buffer, bufferOffset);
    // Serialize message field [marker_y]
    bufferOffset = _serializer.float64(obj.marker_y, buffer, bufferOffset);
    // Serialize message field [marker_z]
    bufferOffset = _serializer.float64(obj.marker_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EyetoHandRequest
    let len;
    let data = new EyetoHandRequest(null);
    // Deserialize message field [marker_x]
    data.marker_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [marker_y]
    data.marker_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [marker_z]
    data.marker_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/EyetoHandRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '871dc000c2d2d2ebd9de156d820ffa1c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 marker_x
    float64 marker_y
    float64 marker_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EyetoHandRequest(null);
    if (msg.marker_x !== undefined) {
      resolved.marker_x = msg.marker_x;
    }
    else {
      resolved.marker_x = 0.0
    }

    if (msg.marker_y !== undefined) {
      resolved.marker_y = msg.marker_y;
    }
    else {
      resolved.marker_y = 0.0
    }

    if (msg.marker_z !== undefined) {
      resolved.marker_z = msg.marker_z;
    }
    else {
      resolved.marker_z = 0.0
    }

    return resolved;
    }
};

class EyetoHandResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obj_x = null;
      this.obj_y = null;
      this.obj_z = null;
    }
    else {
      if (initObj.hasOwnProperty('obj_x')) {
        this.obj_x = initObj.obj_x
      }
      else {
        this.obj_x = 0.0;
      }
      if (initObj.hasOwnProperty('obj_y')) {
        this.obj_y = initObj.obj_y
      }
      else {
        this.obj_y = 0.0;
      }
      if (initObj.hasOwnProperty('obj_z')) {
        this.obj_z = initObj.obj_z
      }
      else {
        this.obj_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EyetoHandResponse
    // Serialize message field [obj_x]
    bufferOffset = _serializer.float64(obj.obj_x, buffer, bufferOffset);
    // Serialize message field [obj_y]
    bufferOffset = _serializer.float64(obj.obj_y, buffer, bufferOffset);
    // Serialize message field [obj_z]
    bufferOffset = _serializer.float64(obj.obj_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EyetoHandResponse
    let len;
    let data = new EyetoHandResponse(null);
    // Deserialize message field [obj_x]
    data.obj_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_y]
    data.obj_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_z]
    data.obj_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/EyetoHandResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ee63385c214e38ca46f0e8b25b9b4dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 obj_x
    float64 obj_y
    float64 obj_z
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EyetoHandResponse(null);
    if (msg.obj_x !== undefined) {
      resolved.obj_x = msg.obj_x;
    }
    else {
      resolved.obj_x = 0.0
    }

    if (msg.obj_y !== undefined) {
      resolved.obj_y = msg.obj_y;
    }
    else {
      resolved.obj_y = 0.0
    }

    if (msg.obj_z !== undefined) {
      resolved.obj_z = msg.obj_z;
    }
    else {
      resolved.obj_z = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: EyetoHandRequest,
  Response: EyetoHandResponse,
  md5sum() { return '9743f28c3a9d1b192b8ad805848bdee3'; },
  datatype() { return 'grasp_demo/EyetoHand'; }
};
