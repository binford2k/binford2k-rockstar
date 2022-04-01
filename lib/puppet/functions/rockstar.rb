Puppet::Functions.create_function(:rockstar) do
  unless Puppet.features.rockstar?
    raise Puppet::Error, 'Running rockstar code is only supported when the kaiser-ruby rockstar interpreter is installed'
  end

  dispatch :on_string do
    param 'String', :val
  end

  dispatch :on_string do
    param 'String', :val
  end

  def on_string(x)
    KaiserRuby.execute(x)
  end
end

