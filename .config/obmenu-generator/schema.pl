#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    {sep => 'menu'},

    #          COMMAND                 LABEL              ICON
    {item => ['thunar',       'thunar', 'system-file-manager']},
    {item => ['alacritty',            'terminal',     'utilities-terminal']},
    {item => ['firefox', 'browser',  'web-browser']},
    {item => ['thunderbird', 'email',  'web-browser']},
    {item => ['keepassxc',            'passwords',  'system-run']},
    {item => ['feh --bg-fill --randomize ~/Pictures/wallpapers/',            'wallpaper',  'system-run']},
    
    
    {sep => 'mpd'},

    #          COMMAND                 LABEL              ICON
    {item => ['mpc toggle',       'mpc toggle', 'system-file-manager']},
    {item => ['mpc next',            'mpc next',     'utilities-terminal']},
    {item => ['mpc prev', 'mpc prev',  'utilities-terminal']},
    {item => ['alacritty --hold -d 70 4 -e mpc', 'mpc info',  'utilities-terminal']},

    {sep => 'my stuff'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'accessories', 'applications-utilities']},
    {cat => ['development', 'development', 'applications-development']},
    {cat => ['education',   'education',   'applications-science']},
    {cat => ['game',        'games',       'applications-games']},
    {cat => ['graphics',    'graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'multimedia',  'applications-multimedia']},
    {cat => ['network',     'network',     'applications-internet']},
    {cat => ['office',      'office',      'applications-office']},
    {cat => ['other',       'other',       'applications-other']},
    {cat => ['settings',    'settings',    'applications-accessories']},
    {cat => ['system',      'system',      'applications-system']},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['advanced settings', 'applications-engineering']},

      # Configuration files
      {item => ["$editor ~/.conkyrc",              'conky rc',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'tint2 panel', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['obmenu-generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'menu schema', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'menu config', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'generate a static menu',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'generate a static menu with icons',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'generate a dynamic menu',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'generate a dynamic menu with icons', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'openbox autostart',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'openbox rc',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'openbox menu',        'text-x-generic']},
        {item => ['openbox --reconfigure',               'reconfigure openbox', 'openbox']},
      {end => undef},
    {end => undef},

    {sep => undef},
    
    {sep => 'time to leave'},

    ## The xscreensaver lock command
    {item => ['betterlockscreen --lock blur', 'lock', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
    {exit => ['logout', 'application-exit']},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'application-exit']},
    
    {item => ['systemctl reboot', 'restart', 'system-lock-screen']},
    {item => ['systemctl suspend', 'suspend', 'system-lock-screen']},
    {item => ['systemctl poweroff', 'shutdown', 'system-lock-screen']},
       
]
