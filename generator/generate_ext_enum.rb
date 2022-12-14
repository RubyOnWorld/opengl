require_relative 'generate_common'

module GLExtEnumCodeGenerator

  def self.generate_enum( out )

    doc = REXML::Document.new(open("./gl.xml"))

    gl_ext_name_to_enums_map = GLCodeGeneratorCommon.build_ext_enums_map(doc, extract_api: "gl")

    # Output
    out.puts GLCodeGeneratorCommon::HeaderComment
    out.puts ""
    out.puts "module GLExt"
    out.puts ""
    GLCodeGeneratorCommon.generate_ext_enums(out, gl_ext_name_to_enums_map)
    out.puts "end"

  end

end

if __FILE__ == $0
  GLExtEnumCodeGenerator.generate_enum( $stdout )
end
