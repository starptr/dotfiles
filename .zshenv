# Remove bad path dirs from windows
badpaths=('/mnt/d/Program Files/nodejs/:' '/mnt/d/Program Files/nodejs/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:' '/mnt/d/yuyun/AppData/Roaming/npm/node_modules/windows-build-tools/node_modules/.bin:' '/mnt/d/yuyun/AppData/Roaming/npm/node_modules/.bin:' '/mnt/d/yuyun/scoop/apps/openjdk15/current:')
# uhhhhpaths=('/mnt/d/Program Files/nodejs/node_modules/npm/node_modules/npm-lifecycle/node-gyp-bin:' '/mnt/d/yuyun/AppData/Roaming/npm/node_modules/windows-build-tools/node_modules/.bin:' '/mnt/d/yuyun/AppData/Roaming/npm/node_modules/.bin:')
for badpath in $badpaths; do
  export PATH=${PATH//$badpath};
done

# Specify default text editor
export EDITOR='nvim'

# X-server support
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null

# GUI theme
export GDK_THEME=Greybird-dark
export QT_STYLE_OVERRIDE=Greybird-dark
