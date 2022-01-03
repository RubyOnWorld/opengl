# opengl-bindings
# * http://rubygems.org/gems/opengl-bindings
# * http://github.com/vaiorabbit/ruby-opengl
#
# [NOTICE] This is an automatically generated file.

module GL

  DEPTH_BUFFER_BIT = 0x00000100
  STENCIL_BUFFER_BIT = 0x00000400
  COLOR_BUFFER_BIT = 0x00004000
  FALSE = 0
  TRUE = 1
  POINTS = 0x0000
  LINES = 0x0001
  LINE_LOOP = 0x0002
  LINE_STRIP = 0x0003
  TRIANGLES = 0x0004
  TRIANGLE_STRIP = 0x0005
  TRIANGLE_FAN = 0x0006
  ZERO = 0
  ONE = 1
  SRC_COLOR = 0x0300
  ONE_MINUS_SRC_COLOR = 0x0301
  SRC_ALPHA = 0x0302
  ONE_MINUS_SRC_ALPHA = 0x0303
  DST_ALPHA = 0x0304
  ONE_MINUS_DST_ALPHA = 0x0305
  DST_COLOR = 0x0306
  ONE_MINUS_DST_COLOR = 0x0307
  SRC_ALPHA_SATURATE = 0x0308
  FUNC_ADD = 0x8006
  BLEND_EQUATION = 0x8009
  BLEND_EQUATION_RGB = 0x8009
  BLEND_EQUATION_ALPHA = 0x883D
  FUNC_SUBTRACT = 0x800A
  FUNC_REVERSE_SUBTRACT = 0x800B
  BLEND_DST_RGB = 0x80C8
  BLEND_SRC_RGB = 0x80C9
  BLEND_DST_ALPHA = 0x80CA
  BLEND_SRC_ALPHA = 0x80CB
  CONSTANT_COLOR = 0x8001
  ONE_MINUS_CONSTANT_COLOR = 0x8002
  CONSTANT_ALPHA = 0x8003
  ONE_MINUS_CONSTANT_ALPHA = 0x8004
  BLEND_COLOR = 0x8005
  ARRAY_BUFFER = 0x8892
  ELEMENT_ARRAY_BUFFER = 0x8893
  ARRAY_BUFFER_BINDING = 0x8894
  ELEMENT_ARRAY_BUFFER_BINDING = 0x8895
  STREAM_DRAW = 0x88E0
  STATIC_DRAW = 0x88E4
  DYNAMIC_DRAW = 0x88E8
  BUFFER_SIZE = 0x8764
  BUFFER_USAGE = 0x8765
  CURRENT_VERTEX_ATTRIB = 0x8626
  FRONT = 0x0404
  BACK = 0x0405
  FRONT_AND_BACK = 0x0408
  TEXTURE_2D = 0x0DE1
  CULL_FACE = 0x0B44
  BLEND = 0x0BE2
  DITHER = 0x0BD0
  STENCIL_TEST = 0x0B90
  DEPTH_TEST = 0x0B71
  SCISSOR_TEST = 0x0C11
  POLYGON_OFFSET_FILL = 0x8037
  SAMPLE_ALPHA_TO_COVERAGE = 0x809E
  SAMPLE_COVERAGE = 0x80A0
  NO_ERROR = 0
  INVALID_ENUM = 0x0500
  INVALID_VALUE = 0x0501
  INVALID_OPERATION = 0x0502
  OUT_OF_MEMORY = 0x0505
  CW = 0x0900
  CCW = 0x0901
  LINE_WIDTH = 0x0B21
  ALIASED_POINT_SIZE_RANGE = 0x846D
  ALIASED_LINE_WIDTH_RANGE = 0x846E
  CULL_FACE_MODE = 0x0B45
  FRONT_FACE = 0x0B46
  DEPTH_RANGE = 0x0B70
  DEPTH_WRITEMASK = 0x0B72
  DEPTH_CLEAR_VALUE = 0x0B73
  DEPTH_FUNC = 0x0B74
  STENCIL_CLEAR_VALUE = 0x0B91
  STENCIL_FUNC = 0x0B92
  STENCIL_FAIL = 0x0B94
  STENCIL_PASS_DEPTH_FAIL = 0x0B95
  STENCIL_PASS_DEPTH_PASS = 0x0B96
  STENCIL_REF = 0x0B97
  STENCIL_VALUE_MASK = 0x0B93
  STENCIL_WRITEMASK = 0x0B98
  STENCIL_BACK_FUNC = 0x8800
  STENCIL_BACK_FAIL = 0x8801
  STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802
  STENCIL_BACK_PASS_DEPTH_PASS = 0x8803
  STENCIL_BACK_REF = 0x8CA3
  STENCIL_BACK_VALUE_MASK = 0x8CA4
  STENCIL_BACK_WRITEMASK = 0x8CA5
  VIEWPORT = 0x0BA2
  SCISSOR_BOX = 0x0C10
  COLOR_CLEAR_VALUE = 0x0C22
  COLOR_WRITEMASK = 0x0C23
  UNPACK_ALIGNMENT = 0x0CF5
  PACK_ALIGNMENT = 0x0D05
  MAX_TEXTURE_SIZE = 0x0D33
  MAX_VIEWPORT_DIMS = 0x0D3A
  SUBPIXEL_BITS = 0x0D50
  RED_BITS = 0x0D52
  GREEN_BITS = 0x0D53
  BLUE_BITS = 0x0D54
  ALPHA_BITS = 0x0D55
  DEPTH_BITS = 0x0D56
  STENCIL_BITS = 0x0D57
  POLYGON_OFFSET_UNITS = 0x2A00
  POLYGON_OFFSET_FACTOR = 0x8038
  TEXTURE_BINDING_2D = 0x8069
  SAMPLE_BUFFERS = 0x80A8
  SAMPLES = 0x80A9
  SAMPLE_COVERAGE_VALUE = 0x80AA
  SAMPLE_COVERAGE_INVERT = 0x80AB
  NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2
  COMPRESSED_TEXTURE_FORMATS = 0x86A3
  DONT_CARE = 0x1100
  FASTEST = 0x1101
  NICEST = 0x1102
  GENERATE_MIPMAP_HINT = 0x8192
  BYTE = 0x1400
  UNSIGNED_BYTE = 0x1401
  SHORT = 0x1402
  UNSIGNED_SHORT = 0x1403
  INT = 0x1404
  UNSIGNED_INT = 0x1405
  FLOAT = 0x1406
  FIXED = 0x140C
  DEPTH_COMPONENT = 0x1902
  ALPHA = 0x1906
  RGB = 0x1907
  RGBA = 0x1908
  LUMINANCE = 0x1909
  LUMINANCE_ALPHA = 0x190A
  UNSIGNED_SHORT_4_4_4_4 = 0x8033
  UNSIGNED_SHORT_5_5_5_1 = 0x8034
  UNSIGNED_SHORT_5_6_5 = 0x8363
  FRAGMENT_SHADER = 0x8B30
  VERTEX_SHADER = 0x8B31
  MAX_VERTEX_ATTRIBS = 0x8869
  MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB
  MAX_VARYING_VECTORS = 0x8DFC
  MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D
  MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C
  MAX_TEXTURE_IMAGE_UNITS = 0x8872
  MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD
  SHADER_TYPE = 0x8B4F
  DELETE_STATUS = 0x8B80
  LINK_STATUS = 0x8B82
  VALIDATE_STATUS = 0x8B83
  ATTACHED_SHADERS = 0x8B85
  ACTIVE_UNIFORMS = 0x8B86
  ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87
  ACTIVE_ATTRIBUTES = 0x8B89
  ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A
  SHADING_LANGUAGE_VERSION = 0x8B8C
  CURRENT_PROGRAM = 0x8B8D
  NEVER = 0x0200
  LESS = 0x0201
  EQUAL = 0x0202
  LEQUAL = 0x0203
  GREATER = 0x0204
  NOTEQUAL = 0x0205
  GEQUAL = 0x0206
  ALWAYS = 0x0207
  KEEP = 0x1E00
  REPLACE = 0x1E01
  INCR = 0x1E02
  DECR = 0x1E03
  INVERT = 0x150A
  INCR_WRAP = 0x8507
  DECR_WRAP = 0x8508
  VENDOR = 0x1F00
  RENDERER = 0x1F01
  VERSION = 0x1F02
  EXTENSIONS = 0x1F03
  NEAREST = 0x2600
  LINEAR = 0x2601
  NEAREST_MIPMAP_NEAREST = 0x2700
  LINEAR_MIPMAP_NEAREST = 0x2701
  NEAREST_MIPMAP_LINEAR = 0x2702
  LINEAR_MIPMAP_LINEAR = 0x2703
  TEXTURE_MAG_FILTER = 0x2800
  TEXTURE_MIN_FILTER = 0x2801
  TEXTURE_WRAP_S = 0x2802
  TEXTURE_WRAP_T = 0x2803
  TEXTURE = 0x1702
  TEXTURE_CUBE_MAP = 0x8513
  TEXTURE_BINDING_CUBE_MAP = 0x8514
  TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515
  TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516
  TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517
  TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518
  TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519
  TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A
  MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C
  TEXTURE0 = 0x84C0
  TEXTURE1 = 0x84C1
  TEXTURE2 = 0x84C2
  TEXTURE3 = 0x84C3
  TEXTURE4 = 0x84C4
  TEXTURE5 = 0x84C5
  TEXTURE6 = 0x84C6
  TEXTURE7 = 0x84C7
  TEXTURE8 = 0x84C8
  TEXTURE9 = 0x84C9
  TEXTURE10 = 0x84CA
  TEXTURE11 = 0x84CB
  TEXTURE12 = 0x84CC
  TEXTURE13 = 0x84CD
  TEXTURE14 = 0x84CE
  TEXTURE15 = 0x84CF
  TEXTURE16 = 0x84D0
  TEXTURE17 = 0x84D1
  TEXTURE18 = 0x84D2
  TEXTURE19 = 0x84D3
  TEXTURE20 = 0x84D4
  TEXTURE21 = 0x84D5
  TEXTURE22 = 0x84D6
  TEXTURE23 = 0x84D7
  TEXTURE24 = 0x84D8
  TEXTURE25 = 0x84D9
  TEXTURE26 = 0x84DA
  TEXTURE27 = 0x84DB
  TEXTURE28 = 0x84DC
  TEXTURE29 = 0x84DD
  TEXTURE30 = 0x84DE
  TEXTURE31 = 0x84DF
  ACTIVE_TEXTURE = 0x84E0
  REPEAT = 0x2901
  CLAMP_TO_EDGE = 0x812F
  MIRRORED_REPEAT = 0x8370
  FLOAT_VEC2 = 0x8B50
  FLOAT_VEC3 = 0x8B51
  FLOAT_VEC4 = 0x8B52
  INT_VEC2 = 0x8B53
  INT_VEC3 = 0x8B54
  INT_VEC4 = 0x8B55
  BOOL = 0x8B56
  BOOL_VEC2 = 0x8B57
  BOOL_VEC3 = 0x8B58
  BOOL_VEC4 = 0x8B59
  FLOAT_MAT2 = 0x8B5A
  FLOAT_MAT3 = 0x8B5B
  FLOAT_MAT4 = 0x8B5C
  SAMPLER_2D = 0x8B5E
  SAMPLER_CUBE = 0x8B60
  VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622
  VERTEX_ATTRIB_ARRAY_SIZE = 0x8623
  VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624
  VERTEX_ATTRIB_ARRAY_TYPE = 0x8625
  VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A
  VERTEX_ATTRIB_ARRAY_POINTER = 0x8645
  VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F
  IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A
  IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B
  COMPILE_STATUS = 0x8B81
  INFO_LOG_LENGTH = 0x8B84
  SHADER_SOURCE_LENGTH = 0x8B88
  SHADER_COMPILER = 0x8DFA
  SHADER_BINARY_FORMATS = 0x8DF8
  NUM_SHADER_BINARY_FORMATS = 0x8DF9
  LOW_FLOAT = 0x8DF0
  MEDIUM_FLOAT = 0x8DF1
  HIGH_FLOAT = 0x8DF2
  LOW_INT = 0x8DF3
  MEDIUM_INT = 0x8DF4
  HIGH_INT = 0x8DF5
  FRAMEBUFFER = 0x8D40
  RENDERBUFFER = 0x8D41
  RGBA4 = 0x8056
  RGB5_A1 = 0x8057
  RGB565 = 0x8D62
  DEPTH_COMPONENT16 = 0x81A5
  STENCIL_INDEX8 = 0x8D48
  RENDERBUFFER_WIDTH = 0x8D42
  RENDERBUFFER_HEIGHT = 0x8D43
  RENDERBUFFER_INTERNAL_FORMAT = 0x8D44
  RENDERBUFFER_RED_SIZE = 0x8D50
  RENDERBUFFER_GREEN_SIZE = 0x8D51
  RENDERBUFFER_BLUE_SIZE = 0x8D52
  RENDERBUFFER_ALPHA_SIZE = 0x8D53
  RENDERBUFFER_DEPTH_SIZE = 0x8D54
  RENDERBUFFER_STENCIL_SIZE = 0x8D55
  FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0
  FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1
  FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2
  FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3
  COLOR_ATTACHMENT0 = 0x8CE0
  DEPTH_ATTACHMENT = 0x8D00
  STENCIL_ATTACHMENT = 0x8D20
  NONE = 0
  FRAMEBUFFER_COMPLETE = 0x8CD5
  FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6
  FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7
  FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9
  FRAMEBUFFER_UNSUPPORTED = 0x8CDD
  FRAMEBUFFER_BINDING = 0x8CA6
  RENDERBUFFER_BINDING = 0x8CA7
  MAX_RENDERBUFFER_SIZE = 0x84E8
  INVALID_FRAMEBUFFER_OPERATION = 0x0506
  READ_BUFFER = 0x0C02
  UNPACK_ROW_LENGTH = 0x0CF2
  UNPACK_SKIP_ROWS = 0x0CF3
  UNPACK_SKIP_PIXELS = 0x0CF4
  PACK_ROW_LENGTH = 0x0D02
  PACK_SKIP_ROWS = 0x0D03
  PACK_SKIP_PIXELS = 0x0D04
  COLOR = 0x1800
  DEPTH = 0x1801
  STENCIL = 0x1802
  RED = 0x1903
  RGB8 = 0x8051
  RGBA8 = 0x8058
  RGB10_A2 = 0x8059
  TEXTURE_BINDING_3D = 0x806A
  UNPACK_SKIP_IMAGES = 0x806D
  UNPACK_IMAGE_HEIGHT = 0x806E
  TEXTURE_3D = 0x806F
  TEXTURE_WRAP_R = 0x8072
  MAX_3D_TEXTURE_SIZE = 0x8073
  UNSIGNED_INT_2_10_10_10_REV = 0x8368
  MAX_ELEMENTS_VERTICES = 0x80E8
  MAX_ELEMENTS_INDICES = 0x80E9
  TEXTURE_MIN_LOD = 0x813A
  TEXTURE_MAX_LOD = 0x813B
  TEXTURE_BASE_LEVEL = 0x813C
  TEXTURE_MAX_LEVEL = 0x813D
  MIN = 0x8007
  MAX = 0x8008
  DEPTH_COMPONENT24 = 0x81A6
  MAX_TEXTURE_LOD_BIAS = 0x84FD
  TEXTURE_COMPARE_MODE = 0x884C
  TEXTURE_COMPARE_FUNC = 0x884D
  CURRENT_QUERY = 0x8865
  QUERY_RESULT = 0x8866
  QUERY_RESULT_AVAILABLE = 0x8867
  BUFFER_MAPPED = 0x88BC
  BUFFER_MAP_POINTER = 0x88BD
  STREAM_READ = 0x88E1
  STREAM_COPY = 0x88E2
  STATIC_READ = 0x88E5
  STATIC_COPY = 0x88E6
  DYNAMIC_READ = 0x88E9
  DYNAMIC_COPY = 0x88EA
  MAX_DRAW_BUFFERS = 0x8824
  DRAW_BUFFER0 = 0x8825
  DRAW_BUFFER1 = 0x8826
  DRAW_BUFFER2 = 0x8827
  DRAW_BUFFER3 = 0x8828
  DRAW_BUFFER4 = 0x8829
  DRAW_BUFFER5 = 0x882A
  DRAW_BUFFER6 = 0x882B
  DRAW_BUFFER7 = 0x882C
  DRAW_BUFFER8 = 0x882D
  DRAW_BUFFER9 = 0x882E
  DRAW_BUFFER10 = 0x882F
  DRAW_BUFFER11 = 0x8830
  DRAW_BUFFER12 = 0x8831
  DRAW_BUFFER13 = 0x8832
  DRAW_BUFFER14 = 0x8833
  DRAW_BUFFER15 = 0x8834
  MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49
  MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A
  SAMPLER_3D = 0x8B5F
  SAMPLER_2D_SHADOW = 0x8B62
  FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B
  PIXEL_PACK_BUFFER = 0x88EB
  PIXEL_UNPACK_BUFFER = 0x88EC
  PIXEL_PACK_BUFFER_BINDING = 0x88ED
  PIXEL_UNPACK_BUFFER_BINDING = 0x88EF
  FLOAT_MAT2x3 = 0x8B65
  FLOAT_MAT2x4 = 0x8B66
  FLOAT_MAT3x2 = 0x8B67
  FLOAT_MAT3x4 = 0x8B68
  FLOAT_MAT4x2 = 0x8B69
  FLOAT_MAT4x3 = 0x8B6A
  SRGB = 0x8C40
  SRGB8 = 0x8C41
  SRGB8_ALPHA8 = 0x8C43
  COMPARE_REF_TO_TEXTURE = 0x884E
  MAJOR_VERSION = 0x821B
  MINOR_VERSION = 0x821C
  NUM_EXTENSIONS = 0x821D
  RGBA32F = 0x8814
  RGB32F = 0x8815
  RGBA16F = 0x881A
  RGB16F = 0x881B
  VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD
  MAX_ARRAY_TEXTURE_LAYERS = 0x88FF
  MIN_PROGRAM_TEXEL_OFFSET = 0x8904
  MAX_PROGRAM_TEXEL_OFFSET = 0x8905
  MAX_VARYING_COMPONENTS = 0x8B4B
  TEXTURE_2D_ARRAY = 0x8C1A
  TEXTURE_BINDING_2D_ARRAY = 0x8C1D
  R11F_G11F_B10F = 0x8C3A
  UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B
  RGB9_E5 = 0x8C3D
  UNSIGNED_INT_5_9_9_9_REV = 0x8C3E
  TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76
  TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F
  MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80
  TRANSFORM_FEEDBACK_VARYINGS = 0x8C83
  TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84
  TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85
  TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88
  RASTERIZER_DISCARD = 0x8C89
  MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A
  MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B
  INTERLEAVED_ATTRIBS = 0x8C8C
  SEPARATE_ATTRIBS = 0x8C8D
  TRANSFORM_FEEDBACK_BUFFER = 0x8C8E
  TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F
  RGBA32UI = 0x8D70
  RGB32UI = 0x8D71
  RGBA16UI = 0x8D76
  RGB16UI = 0x8D77
  RGBA8UI = 0x8D7C
  RGB8UI = 0x8D7D
  RGBA32I = 0x8D82
  RGB32I = 0x8D83
  RGBA16I = 0x8D88
  RGB16I = 0x8D89
  RGBA8I = 0x8D8E
  RGB8I = 0x8D8F
  RED_INTEGER = 0x8D94
  RGB_INTEGER = 0x8D98
  RGBA_INTEGER = 0x8D99
  SAMPLER_2D_ARRAY = 0x8DC1
  SAMPLER_2D_ARRAY_SHADOW = 0x8DC4
  SAMPLER_CUBE_SHADOW = 0x8DC5
  UNSIGNED_INT_VEC2 = 0x8DC6
  UNSIGNED_INT_VEC3 = 0x8DC7
  UNSIGNED_INT_VEC4 = 0x8DC8
  INT_SAMPLER_2D = 0x8DCA
  INT_SAMPLER_3D = 0x8DCB
  INT_SAMPLER_CUBE = 0x8DCC
  INT_SAMPLER_2D_ARRAY = 0x8DCF
  UNSIGNED_INT_SAMPLER_2D = 0x8DD2
  UNSIGNED_INT_SAMPLER_3D = 0x8DD3
  UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4
  UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7
  BUFFER_ACCESS_FLAGS = 0x911F
  BUFFER_MAP_LENGTH = 0x9120
  BUFFER_MAP_OFFSET = 0x9121
  DEPTH_COMPONENT32F = 0x8CAC
  DEPTH32F_STENCIL8 = 0x8CAD
  FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD
  FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210
  FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211
  FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212
  FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213
  FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214
  FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215
  FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216
  FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217
  FRAMEBUFFER_DEFAULT = 0x8218
  FRAMEBUFFER_UNDEFINED = 0x8219
  DEPTH_STENCIL_ATTACHMENT = 0x821A
  DEPTH_STENCIL = 0x84F9
  UNSIGNED_INT_24_8 = 0x84FA
  DEPTH24_STENCIL8 = 0x88F0
  UNSIGNED_NORMALIZED = 0x8C17
  DRAW_FRAMEBUFFER_BINDING = 0x8CA6
  READ_FRAMEBUFFER = 0x8CA8
  DRAW_FRAMEBUFFER = 0x8CA9
  READ_FRAMEBUFFER_BINDING = 0x8CAA
  RENDERBUFFER_SAMPLES = 0x8CAB
  FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4
  MAX_COLOR_ATTACHMENTS = 0x8CDF
  COLOR_ATTACHMENT1 = 0x8CE1
  COLOR_ATTACHMENT2 = 0x8CE2
  COLOR_ATTACHMENT3 = 0x8CE3
  COLOR_ATTACHMENT4 = 0x8CE4
  COLOR_ATTACHMENT5 = 0x8CE5
  COLOR_ATTACHMENT6 = 0x8CE6
  COLOR_ATTACHMENT7 = 0x8CE7
  COLOR_ATTACHMENT8 = 0x8CE8
  COLOR_ATTACHMENT9 = 0x8CE9
  COLOR_ATTACHMENT10 = 0x8CEA
  COLOR_ATTACHMENT11 = 0x8CEB
  COLOR_ATTACHMENT12 = 0x8CEC
  COLOR_ATTACHMENT13 = 0x8CED
  COLOR_ATTACHMENT14 = 0x8CEE
  COLOR_ATTACHMENT15 = 0x8CEF
  COLOR_ATTACHMENT16 = 0x8CF0
  COLOR_ATTACHMENT17 = 0x8CF1
  COLOR_ATTACHMENT18 = 0x8CF2
  COLOR_ATTACHMENT19 = 0x8CF3
  COLOR_ATTACHMENT20 = 0x8CF4
  COLOR_ATTACHMENT21 = 0x8CF5
  COLOR_ATTACHMENT22 = 0x8CF6
  COLOR_ATTACHMENT23 = 0x8CF7
  COLOR_ATTACHMENT24 = 0x8CF8
  COLOR_ATTACHMENT25 = 0x8CF9
  COLOR_ATTACHMENT26 = 0x8CFA
  COLOR_ATTACHMENT27 = 0x8CFB
  COLOR_ATTACHMENT28 = 0x8CFC
  COLOR_ATTACHMENT29 = 0x8CFD
  COLOR_ATTACHMENT30 = 0x8CFE
  COLOR_ATTACHMENT31 = 0x8CFF
  FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56
  MAX_SAMPLES = 0x8D57
  HALF_FLOAT = 0x140B
  MAP_READ_BIT = 0x0001
  MAP_WRITE_BIT = 0x0002
  MAP_INVALIDATE_RANGE_BIT = 0x0004
  MAP_INVALIDATE_BUFFER_BIT = 0x0008
  MAP_FLUSH_EXPLICIT_BIT = 0x0010
  MAP_UNSYNCHRONIZED_BIT = 0x0020
  RG = 0x8227
  RG_INTEGER = 0x8228
  R8 = 0x8229
  RG8 = 0x822B
  R16F = 0x822D
  R32F = 0x822E
  RG16F = 0x822F
  RG32F = 0x8230
  R8I = 0x8231
  R8UI = 0x8232
  R16I = 0x8233
  R16UI = 0x8234
  R32I = 0x8235
  R32UI = 0x8236
  RG8I = 0x8237
  RG8UI = 0x8238
  RG16I = 0x8239
  RG16UI = 0x823A
  RG32I = 0x823B
  RG32UI = 0x823C
  VERTEX_ARRAY_BINDING = 0x85B5
  R8_SNORM = 0x8F94
  RG8_SNORM = 0x8F95
  RGB8_SNORM = 0x8F96
  RGBA8_SNORM = 0x8F97
  SIGNED_NORMALIZED = 0x8F9C
  PRIMITIVE_RESTART_FIXED_INDEX = 0x8D69
  COPY_READ_BUFFER = 0x8F36
  COPY_WRITE_BUFFER = 0x8F37
  COPY_READ_BUFFER_BINDING = 0x8F36
  COPY_WRITE_BUFFER_BINDING = 0x8F37
  UNIFORM_BUFFER = 0x8A11
  UNIFORM_BUFFER_BINDING = 0x8A28
  UNIFORM_BUFFER_START = 0x8A29
  UNIFORM_BUFFER_SIZE = 0x8A2A
  MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B
  MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D
  MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E
  MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F
  MAX_UNIFORM_BLOCK_SIZE = 0x8A30
  MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31
  MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33
  UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34
  ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35
  ACTIVE_UNIFORM_BLOCKS = 0x8A36
  UNIFORM_TYPE = 0x8A37
  UNIFORM_SIZE = 0x8A38
  UNIFORM_NAME_LENGTH = 0x8A39
  UNIFORM_BLOCK_INDEX = 0x8A3A
  UNIFORM_OFFSET = 0x8A3B
  UNIFORM_ARRAY_STRIDE = 0x8A3C
  UNIFORM_MATRIX_STRIDE = 0x8A3D
  UNIFORM_IS_ROW_MAJOR = 0x8A3E
  UNIFORM_BLOCK_BINDING = 0x8A3F
  UNIFORM_BLOCK_DATA_SIZE = 0x8A40
  UNIFORM_BLOCK_NAME_LENGTH = 0x8A41
  UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42
  UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43
  UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44
  UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46
  INVALID_INDEX = 0xFFFFFFFF
  MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122
  MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125
  MAX_SERVER_WAIT_TIMEOUT = 0x9111
  OBJECT_TYPE = 0x9112
  SYNC_CONDITION = 0x9113
  SYNC_STATUS = 0x9114
  SYNC_FLAGS = 0x9115
  SYNC_FENCE = 0x9116
  SYNC_GPU_COMMANDS_COMPLETE = 0x9117
  UNSIGNALED = 0x9118
  SIGNALED = 0x9119
  ALREADY_SIGNALED = 0x911A
  TIMEOUT_EXPIRED = 0x911B
  CONDITION_SATISFIED = 0x911C
  WAIT_FAILED = 0x911D
  SYNC_FLUSH_COMMANDS_BIT = 0x00000001
  TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF
  VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE
  ANY_SAMPLES_PASSED = 0x8C2F
  ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A
  SAMPLER_BINDING = 0x8919
  RGB10_A2UI = 0x906F
  TEXTURE_SWIZZLE_R = 0x8E42
  TEXTURE_SWIZZLE_G = 0x8E43
  TEXTURE_SWIZZLE_B = 0x8E44
  TEXTURE_SWIZZLE_A = 0x8E45
  GREEN = 0x1904
  BLUE = 0x1905
  INT_2_10_10_10_REV = 0x8D9F
  TRANSFORM_FEEDBACK = 0x8E22
  TRANSFORM_FEEDBACK_PAUSED = 0x8E23
  TRANSFORM_FEEDBACK_ACTIVE = 0x8E24
  TRANSFORM_FEEDBACK_BINDING = 0x8E25
  PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257
  PROGRAM_BINARY_LENGTH = 0x8741
  NUM_PROGRAM_BINARY_FORMATS = 0x87FE
  PROGRAM_BINARY_FORMATS = 0x87FF
  COMPRESSED_R11_EAC = 0x9270
  COMPRESSED_SIGNED_R11_EAC = 0x9271
  COMPRESSED_RG11_EAC = 0x9272
  COMPRESSED_SIGNED_RG11_EAC = 0x9273
  COMPRESSED_RGB8_ETC2 = 0x9274
  COMPRESSED_SRGB8_ETC2 = 0x9275
  COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276
  COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277
  COMPRESSED_RGBA8_ETC2_EAC = 0x9278
  COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279
  TEXTURE_IMMUTABLE_FORMAT = 0x912F
  MAX_ELEMENT_INDEX = 0x8D6B
  NUM_SAMPLE_COUNTS = 0x9380
  TEXTURE_IMMUTABLE_LEVELS = 0x82DF
  COMPUTE_SHADER = 0x91B9
  MAX_COMPUTE_UNIFORM_BLOCKS = 0x91BB
  MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 0x91BC
  MAX_COMPUTE_IMAGE_UNIFORMS = 0x91BD
  MAX_COMPUTE_SHARED_MEMORY_SIZE = 0x8262
  MAX_COMPUTE_UNIFORM_COMPONENTS = 0x8263
  MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 0x8264
  MAX_COMPUTE_ATOMIC_COUNTERS = 0x8265
  MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 0x8266
  MAX_COMPUTE_WORK_GROUP_INVOCATIONS = 0x90EB
  MAX_COMPUTE_WORK_GROUP_COUNT = 0x91BE
  MAX_COMPUTE_WORK_GROUP_SIZE = 0x91BF
  COMPUTE_WORK_GROUP_SIZE = 0x8267
  DISPATCH_INDIRECT_BUFFER = 0x90EE
  DISPATCH_INDIRECT_BUFFER_BINDING = 0x90EF
  COMPUTE_SHADER_BIT = 0x00000020
  DRAW_INDIRECT_BUFFER = 0x8F3F
  DRAW_INDIRECT_BUFFER_BINDING = 0x8F43
  MAX_UNIFORM_LOCATIONS = 0x826E
  FRAMEBUFFER_DEFAULT_WIDTH = 0x9310
  FRAMEBUFFER_DEFAULT_HEIGHT = 0x9311
  FRAMEBUFFER_DEFAULT_SAMPLES = 0x9313
  FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314
  MAX_FRAMEBUFFER_WIDTH = 0x9315
  MAX_FRAMEBUFFER_HEIGHT = 0x9316
  MAX_FRAMEBUFFER_SAMPLES = 0x9318
  UNIFORM = 0x92E1
  UNIFORM_BLOCK = 0x92E2
  PROGRAM_INPUT = 0x92E3
  PROGRAM_OUTPUT = 0x92E4
  BUFFER_VARIABLE = 0x92E5
  SHADER_STORAGE_BLOCK = 0x92E6
  ATOMIC_COUNTER_BUFFER = 0x92C0
  TRANSFORM_FEEDBACK_VARYING = 0x92F4
  ACTIVE_RESOURCES = 0x92F5
  MAX_NAME_LENGTH = 0x92F6
  MAX_NUM_ACTIVE_VARIABLES = 0x92F7
  NAME_LENGTH = 0x92F9
  TYPE = 0x92FA
  ARRAY_SIZE = 0x92FB
  OFFSET = 0x92FC
  BLOCK_INDEX = 0x92FD
  ARRAY_STRIDE = 0x92FE
  MATRIX_STRIDE = 0x92FF
  IS_ROW_MAJOR = 0x9300
  ATOMIC_COUNTER_BUFFER_INDEX = 0x9301
  BUFFER_BINDING = 0x9302
  BUFFER_DATA_SIZE = 0x9303
  NUM_ACTIVE_VARIABLES = 0x9304
  ACTIVE_VARIABLES = 0x9305
  REFERENCED_BY_VERTEX_SHADER = 0x9306
  REFERENCED_BY_FRAGMENT_SHADER = 0x930A
  REFERENCED_BY_COMPUTE_SHADER = 0x930B
  TOP_LEVEL_ARRAY_SIZE = 0x930C
  TOP_LEVEL_ARRAY_STRIDE = 0x930D
  LOCATION = 0x930E
  VERTEX_SHADER_BIT = 0x00000001
  FRAGMENT_SHADER_BIT = 0x00000002
  ALL_SHADER_BITS = 0xFFFFFFFF
  PROGRAM_SEPARABLE = 0x8258
  ACTIVE_PROGRAM = 0x8259
  PROGRAM_PIPELINE_BINDING = 0x825A
  ATOMIC_COUNTER_BUFFER_BINDING = 0x92C1
  ATOMIC_COUNTER_BUFFER_START = 0x92C2
  ATOMIC_COUNTER_BUFFER_SIZE = 0x92C3
  MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 0x92CC
  MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 0x92D0
  MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 0x92D1
  MAX_VERTEX_ATOMIC_COUNTERS = 0x92D2
  MAX_FRAGMENT_ATOMIC_COUNTERS = 0x92D6
  MAX_COMBINED_ATOMIC_COUNTERS = 0x92D7
  MAX_ATOMIC_COUNTER_BUFFER_SIZE = 0x92D8
  MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 0x92DC
  ACTIVE_ATOMIC_COUNTER_BUFFERS = 0x92D9
  UNSIGNED_INT_ATOMIC_COUNTER = 0x92DB
  MAX_IMAGE_UNITS = 0x8F38
  MAX_VERTEX_IMAGE_UNIFORMS = 0x90CA
  MAX_FRAGMENT_IMAGE_UNIFORMS = 0x90CE
  MAX_COMBINED_IMAGE_UNIFORMS = 0x90CF
  IMAGE_BINDING_NAME = 0x8F3A
  IMAGE_BINDING_LEVEL = 0x8F3B
  IMAGE_BINDING_LAYERED = 0x8F3C
  IMAGE_BINDING_LAYER = 0x8F3D
  IMAGE_BINDING_ACCESS = 0x8F3E
  IMAGE_BINDING_FORMAT = 0x906E
  VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 0x00000001
  ELEMENT_ARRAY_BARRIER_BIT = 0x00000002
  UNIFORM_BARRIER_BIT = 0x00000004
  TEXTURE_FETCH_BARRIER_BIT = 0x00000008
  SHADER_IMAGE_ACCESS_BARRIER_BIT = 0x00000020
  COMMAND_BARRIER_BIT = 0x00000040
  PIXEL_BUFFER_BARRIER_BIT = 0x00000080
  TEXTURE_UPDATE_BARRIER_BIT = 0x00000100
  BUFFER_UPDATE_BARRIER_BIT = 0x00000200
  FRAMEBUFFER_BARRIER_BIT = 0x00000400
  TRANSFORM_FEEDBACK_BARRIER_BIT = 0x00000800
  ATOMIC_COUNTER_BARRIER_BIT = 0x00001000
  ALL_BARRIER_BITS = 0xFFFFFFFF
  IMAGE_2D = 0x904D
  IMAGE_3D = 0x904E
  IMAGE_CUBE = 0x9050
  IMAGE_2D_ARRAY = 0x9053
  INT_IMAGE_2D = 0x9058
  INT_IMAGE_3D = 0x9059
  INT_IMAGE_CUBE = 0x905B
  INT_IMAGE_2D_ARRAY = 0x905E
  UNSIGNED_INT_IMAGE_2D = 0x9063
  UNSIGNED_INT_IMAGE_3D = 0x9064
  UNSIGNED_INT_IMAGE_CUBE = 0x9066
  UNSIGNED_INT_IMAGE_2D_ARRAY = 0x9069
  IMAGE_FORMAT_COMPATIBILITY_TYPE = 0x90C7
  IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 0x90C8
  IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 0x90C9
  READ_ONLY = 0x88B8
  WRITE_ONLY = 0x88B9
  READ_WRITE = 0x88BA
  SHADER_STORAGE_BUFFER = 0x90D2
  SHADER_STORAGE_BUFFER_BINDING = 0x90D3
  SHADER_STORAGE_BUFFER_START = 0x90D4
  SHADER_STORAGE_BUFFER_SIZE = 0x90D5
  MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6
  MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA
  MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB
  MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC
  MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD
  MAX_SHADER_STORAGE_BLOCK_SIZE = 0x90DE
  SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF
  SHADER_STORAGE_BARRIER_BIT = 0x00002000
  MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 0x8F39
  DEPTH_STENCIL_TEXTURE_MODE = 0x90EA
  STENCIL_INDEX = 0x1901
  MIN_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5E
  MAX_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5F
  SAMPLE_POSITION = 0x8E50
  SAMPLE_MASK = 0x8E51
  SAMPLE_MASK_VALUE = 0x8E52
  TEXTURE_2D_MULTISAMPLE = 0x9100
  MAX_SAMPLE_MASK_WORDS = 0x8E59
  MAX_COLOR_TEXTURE_SAMPLES = 0x910E
  MAX_DEPTH_TEXTURE_SAMPLES = 0x910F
  MAX_INTEGER_SAMPLES = 0x9110
  TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104
  TEXTURE_SAMPLES = 0x9106
  TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107
  TEXTURE_WIDTH = 0x1000
  TEXTURE_HEIGHT = 0x1001
  TEXTURE_DEPTH = 0x8071
  TEXTURE_INTERNAL_FORMAT = 0x1003
  TEXTURE_RED_SIZE = 0x805C
  TEXTURE_GREEN_SIZE = 0x805D
  TEXTURE_BLUE_SIZE = 0x805E
  TEXTURE_ALPHA_SIZE = 0x805F
  TEXTURE_DEPTH_SIZE = 0x884A
  TEXTURE_STENCIL_SIZE = 0x88F1
  TEXTURE_SHARED_SIZE = 0x8C3F
  TEXTURE_RED_TYPE = 0x8C10
  TEXTURE_GREEN_TYPE = 0x8C11
  TEXTURE_BLUE_TYPE = 0x8C12
  TEXTURE_ALPHA_TYPE = 0x8C13
  TEXTURE_DEPTH_TYPE = 0x8C16
  TEXTURE_COMPRESSED = 0x86A1
  SAMPLER_2D_MULTISAMPLE = 0x9108
  INT_SAMPLER_2D_MULTISAMPLE = 0x9109
  UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A
  VERTEX_ATTRIB_BINDING = 0x82D4
  VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D5
  VERTEX_BINDING_DIVISOR = 0x82D6
  VERTEX_BINDING_OFFSET = 0x82D7
  VERTEX_BINDING_STRIDE = 0x82D8
  VERTEX_BINDING_BUFFER = 0x8F4F
  MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9
  MAX_VERTEX_ATTRIB_BINDINGS = 0x82DA
  MAX_VERTEX_ATTRIB_STRIDE = 0x82E5
  MULTISAMPLE_LINE_WIDTH_RANGE = 0x9381
  MULTISAMPLE_LINE_WIDTH_GRANULARITY = 0x9382
  MULTIPLY = 0x9294
  SCREEN = 0x9295
  OVERLAY = 0x9296
  DARKEN = 0x9297
  LIGHTEN = 0x9298
  COLORDODGE = 0x9299
  COLORBURN = 0x929A
  HARDLIGHT = 0x929B
  SOFTLIGHT = 0x929C
  DIFFERENCE = 0x929E
  EXCLUSION = 0x92A0
  HSL_HUE = 0x92AD
  HSL_SATURATION = 0x92AE
  HSL_COLOR = 0x92AF
  HSL_LUMINOSITY = 0x92B0
  DEBUG_OUTPUT_SYNCHRONOUS = 0x8242
  DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 0x8243
  DEBUG_CALLBACK_FUNCTION = 0x8244
  DEBUG_CALLBACK_USER_PARAM = 0x8245
  DEBUG_SOURCE_API = 0x8246
  DEBUG_SOURCE_WINDOW_SYSTEM = 0x8247
  DEBUG_SOURCE_SHADER_COMPILER = 0x8248
  DEBUG_SOURCE_THIRD_PARTY = 0x8249
  DEBUG_SOURCE_APPLICATION = 0x824A
  DEBUG_SOURCE_OTHER = 0x824B
  DEBUG_TYPE_ERROR = 0x824C
  DEBUG_TYPE_DEPRECATED_BEHAVIOR = 0x824D
  DEBUG_TYPE_UNDEFINED_BEHAVIOR = 0x824E
  DEBUG_TYPE_PORTABILITY = 0x824F
  DEBUG_TYPE_PERFORMANCE = 0x8250
  DEBUG_TYPE_OTHER = 0x8251
  DEBUG_TYPE_MARKER = 0x8268
  DEBUG_TYPE_PUSH_GROUP = 0x8269
  DEBUG_TYPE_POP_GROUP = 0x826A
  DEBUG_SEVERITY_NOTIFICATION = 0x826B
  MAX_DEBUG_GROUP_STACK_DEPTH = 0x826C
  DEBUG_GROUP_STACK_DEPTH = 0x826D
  BUFFER = 0x82E0
  SHADER = 0x82E1
  PROGRAM = 0x82E2
  VERTEX_ARRAY = 0x8074
  QUERY = 0x82E3
  PROGRAM_PIPELINE = 0x82E4
  SAMPLER = 0x82E6
  MAX_LABEL_LENGTH = 0x82E8
  MAX_DEBUG_MESSAGE_LENGTH = 0x9143
  MAX_DEBUG_LOGGED_MESSAGES = 0x9144
  DEBUG_LOGGED_MESSAGES = 0x9145
  DEBUG_SEVERITY_HIGH = 0x9146
  DEBUG_SEVERITY_MEDIUM = 0x9147
  DEBUG_SEVERITY_LOW = 0x9148
  DEBUG_OUTPUT = 0x92E0
  CONTEXT_FLAG_DEBUG_BIT = 0x00000002
  STACK_OVERFLOW = 0x0503
  STACK_UNDERFLOW = 0x0504
  GEOMETRY_SHADER = 0x8DD9
  GEOMETRY_SHADER_BIT = 0x00000004
  GEOMETRY_VERTICES_OUT = 0x8916
  GEOMETRY_INPUT_TYPE = 0x8917
  GEOMETRY_OUTPUT_TYPE = 0x8918
  GEOMETRY_SHADER_INVOCATIONS = 0x887F
  LAYER_PROVOKING_VERTEX = 0x825E
  LINES_ADJACENCY = 0x000A
  LINE_STRIP_ADJACENCY = 0x000B
  TRIANGLES_ADJACENCY = 0x000C
  TRIANGLE_STRIP_ADJACENCY = 0x000D
  MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF
  MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C
  MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32
  MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123
  MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124
  MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0
  MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1
  MAX_GEOMETRY_SHADER_INVOCATIONS = 0x8E5A
  MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29
  MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 0x92CF
  MAX_GEOMETRY_ATOMIC_COUNTERS = 0x92D5
  MAX_GEOMETRY_IMAGE_UNIFORMS = 0x90CD
  MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7
  FIRST_VERTEX_CONVENTION = 0x8E4D
  LAST_VERTEX_CONVENTION = 0x8E4E
  UNDEFINED_VERTEX = 0x8260
  PRIMITIVES_GENERATED = 0x8C87
  FRAMEBUFFER_DEFAULT_LAYERS = 0x9312
  MAX_FRAMEBUFFER_LAYERS = 0x9317
  FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8
  FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7
  REFERENCED_BY_GEOMETRY_SHADER = 0x9309
  PRIMITIVE_BOUNDING_BOX = 0x92BE
  CONTEXT_FLAG_ROBUST_ACCESS_BIT = 0x00000004
  CONTEXT_FLAGS = 0x821E
  LOSE_CONTEXT_ON_RESET = 0x8252
  GUILTY_CONTEXT_RESET = 0x8253
  INNOCENT_CONTEXT_RESET = 0x8254
  UNKNOWN_CONTEXT_RESET = 0x8255
  RESET_NOTIFICATION_STRATEGY = 0x8256
  NO_RESET_NOTIFICATION = 0x8261
  CONTEXT_LOST = 0x0507
  SAMPLE_SHADING = 0x8C36
  MIN_SAMPLE_SHADING_VALUE = 0x8C37
  MIN_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5B
  MAX_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5C
  FRAGMENT_INTERPOLATION_OFFSET_BITS = 0x8E5D
  PATCHES = 0x000E
  PATCH_VERTICES = 0x8E72
  TESS_CONTROL_OUTPUT_VERTICES = 0x8E75
  TESS_GEN_MODE = 0x8E76
  TESS_GEN_SPACING = 0x8E77
  TESS_GEN_VERTEX_ORDER = 0x8E78
  TESS_GEN_POINT_MODE = 0x8E79
  ISOLINES = 0x8E7A
  QUADS = 0x0007
  FRACTIONAL_ODD = 0x8E7B
  FRACTIONAL_EVEN = 0x8E7C
  MAX_PATCH_VERTICES = 0x8E7D
  MAX_TESS_GEN_LEVEL = 0x8E7E
  MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E7F
  MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E80
  MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 0x8E81
  MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 0x8E82
  MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 0x8E83
  MAX_TESS_PATCH_COMPONENTS = 0x8E84
  MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 0x8E85
  MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 0x8E86
  MAX_TESS_CONTROL_UNIFORM_BLOCKS = 0x8E89
  MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 0x8E8A
  MAX_TESS_CONTROL_INPUT_COMPONENTS = 0x886C
  MAX_TESS_EVALUATION_INPUT_COMPONENTS = 0x886D
  MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E1E
  MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F
  MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 0x92CD
  MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 0x92CE
  MAX_TESS_CONTROL_ATOMIC_COUNTERS = 0x92D3
  MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 0x92D4
  MAX_TESS_CONTROL_IMAGE_UNIFORMS = 0x90CB
  MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 0x90CC
  MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8
  MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9
  PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = 0x8221
  IS_PER_PATCH = 0x92E7
  REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307
  REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308
  TESS_CONTROL_SHADER = 0x8E88
  TESS_EVALUATION_SHADER = 0x8E87
  TESS_CONTROL_SHADER_BIT = 0x00000008
  TESS_EVALUATION_SHADER_BIT = 0x00000010
  TEXTURE_BORDER_COLOR = 0x1004
  CLAMP_TO_BORDER = 0x812D
  TEXTURE_BUFFER = 0x8C2A
  TEXTURE_BUFFER_BINDING = 0x8C2A
  MAX_TEXTURE_BUFFER_SIZE = 0x8C2B
  TEXTURE_BINDING_BUFFER = 0x8C2C
  TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D
  TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F
  SAMPLER_BUFFER = 0x8DC2
  INT_SAMPLER_BUFFER = 0x8DD0
  UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8
  IMAGE_BUFFER = 0x9051
  INT_IMAGE_BUFFER = 0x905C
  UNSIGNED_INT_IMAGE_BUFFER = 0x9067
  TEXTURE_BUFFER_OFFSET = 0x919D
  TEXTURE_BUFFER_SIZE = 0x919E
  COMPRESSED_RGBA_ASTC_4x4 = 0x93B0
  COMPRESSED_RGBA_ASTC_5x4 = 0x93B1
  COMPRESSED_RGBA_ASTC_5x5 = 0x93B2
  COMPRESSED_RGBA_ASTC_6x5 = 0x93B3
  COMPRESSED_RGBA_ASTC_6x6 = 0x93B4
  COMPRESSED_RGBA_ASTC_8x5 = 0x93B5
  COMPRESSED_RGBA_ASTC_8x6 = 0x93B6
  COMPRESSED_RGBA_ASTC_8x8 = 0x93B7
  COMPRESSED_RGBA_ASTC_10x5 = 0x93B8
  COMPRESSED_RGBA_ASTC_10x6 = 0x93B9
  COMPRESSED_RGBA_ASTC_10x8 = 0x93BA
  COMPRESSED_RGBA_ASTC_10x10 = 0x93BB
  COMPRESSED_RGBA_ASTC_12x10 = 0x93BC
  COMPRESSED_RGBA_ASTC_12x12 = 0x93BD
  COMPRESSED_SRGB8_ALPHA8_ASTC_4x4 = 0x93D0
  COMPRESSED_SRGB8_ALPHA8_ASTC_5x4 = 0x93D1
  COMPRESSED_SRGB8_ALPHA8_ASTC_5x5 = 0x93D2
  COMPRESSED_SRGB8_ALPHA8_ASTC_6x5 = 0x93D3
  COMPRESSED_SRGB8_ALPHA8_ASTC_6x6 = 0x93D4
  COMPRESSED_SRGB8_ALPHA8_ASTC_8x5 = 0x93D5
  COMPRESSED_SRGB8_ALPHA8_ASTC_8x6 = 0x93D6
  COMPRESSED_SRGB8_ALPHA8_ASTC_8x8 = 0x93D7
  COMPRESSED_SRGB8_ALPHA8_ASTC_10x5 = 0x93D8
  COMPRESSED_SRGB8_ALPHA8_ASTC_10x6 = 0x93D9
  COMPRESSED_SRGB8_ALPHA8_ASTC_10x8 = 0x93DA
  COMPRESSED_SRGB8_ALPHA8_ASTC_10x10 = 0x93DB
  COMPRESSED_SRGB8_ALPHA8_ASTC_12x10 = 0x93DC
  COMPRESSED_SRGB8_ALPHA8_ASTC_12x12 = 0x93DD
  TEXTURE_CUBE_MAP_ARRAY = 0x9009
  TEXTURE_BINDING_CUBE_MAP_ARRAY = 0x900A
  SAMPLER_CUBE_MAP_ARRAY = 0x900C
  SAMPLER_CUBE_MAP_ARRAY_SHADOW = 0x900D
  INT_SAMPLER_CUBE_MAP_ARRAY = 0x900E
  UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = 0x900F
  IMAGE_CUBE_MAP_ARRAY = 0x9054
  INT_IMAGE_CUBE_MAP_ARRAY = 0x905F
  UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 0x906A
  TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102
  TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105
  SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B
  INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C
  UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D

end
