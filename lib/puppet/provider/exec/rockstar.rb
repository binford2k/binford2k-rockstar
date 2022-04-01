require 'puppet/provider/exec'

Puppet::Type.type(:exec).provide :rockstar, :parent => Puppet::Provider do
  confine    :feature => :rockstar
  defaultfor :feature => :rockstar

  desc <<-EOT
    Runs code strings or scripts using the Rockstar interpreter
  EOT

  def run(command, check = false)
    path = File.expand_path(command)
    if File.exist? path
      output = KaiserRuby.execute(File.read(path))
    else
      output = KaiserRuby.execute(command)
    end
    return output, self
  end

  def validatecmd(command)
    true
  end

  def exitstatus
    0
  end
end

