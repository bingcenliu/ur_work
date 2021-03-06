# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from grasp_demo/CamToRealRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class CamToRealRequest(genpy.Message):
  _md5sum = "0f1ded65a8e7c18f92cd2452807e658e"
  _type = "grasp_demo/CamToRealRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float64 pixel_x
float64 pixel_y
"""
  __slots__ = ['pixel_x','pixel_y']
  _slot_types = ['float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       pixel_x,pixel_y

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CamToRealRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.pixel_x is None:
        self.pixel_x = 0.
      if self.pixel_y is None:
        self.pixel_y = 0.
    else:
      self.pixel_x = 0.
      self.pixel_y = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2d().pack(_x.pixel_x, _x.pixel_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.pixel_x, _x.pixel_y,) = _get_struct_2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2d().pack(_x.pixel_x, _x.pixel_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.pixel_x, _x.pixel_y,) = _get_struct_2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2d = None
def _get_struct_2d():
    global _struct_2d
    if _struct_2d is None:
        _struct_2d = struct.Struct("<2d")
    return _struct_2d
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from grasp_demo/CamToRealResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class CamToRealResponse(genpy.Message):
  _md5sum = "f8a34a4411ad0412a5ef662d2317a130"
  _type = "grasp_demo/CamToRealResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float64 obj_x
float64 obj_y
float64 obj_z
bool result




"""
  __slots__ = ['obj_x','obj_y','obj_z','result']
  _slot_types = ['float64','float64','float64','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       obj_x,obj_y,obj_z,result

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CamToRealResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.obj_x is None:
        self.obj_x = 0.
      if self.obj_y is None:
        self.obj_y = 0.
      if self.obj_z is None:
        self.obj_z = 0.
      if self.result is None:
        self.result = False
    else:
      self.obj_x = 0.
      self.obj_y = 0.
      self.obj_z = 0.
      self.result = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3dB().pack(_x.obj_x, _x.obj_y, _x.obj_z, _x.result))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 25
      (_x.obj_x, _x.obj_y, _x.obj_z, _x.result,) = _get_struct_3dB().unpack(str[start:end])
      self.result = bool(self.result)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3dB().pack(_x.obj_x, _x.obj_y, _x.obj_z, _x.result))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 25
      (_x.obj_x, _x.obj_y, _x.obj_z, _x.result,) = _get_struct_3dB().unpack(str[start:end])
      self.result = bool(self.result)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3dB = None
def _get_struct_3dB():
    global _struct_3dB
    if _struct_3dB is None:
        _struct_3dB = struct.Struct("<3dB")
    return _struct_3dB
class CamToReal(object):
  _type          = 'grasp_demo/CamToReal'
  _md5sum = '189ac79be7b27a6947e618b03843336a'
  _request_class  = CamToRealRequest
  _response_class = CamToRealResponse
