class RodaAppGenerator < Greg::Generator
  def files
    [
     Greg::FileTreeTemplate.new("templates"),
     # FromTemplate.new("templates/<template-name>"),
     # FileTemplate.new("templates/<template-name>"),
     # DirTemplate.new("<dir-name>"),
    ]
  end
end
