-- Default Hilbish config
local hilbish = require 'hilbish'
local lunacolors = require 'lunacolors'
local bait = require 'bait'
local ansikit = require 'ansikit'

local function doPrompt(fail)
   hilbish.prompt(
      lunacolors.format(
         '{yellow}%u {white}in {red}%h {white}in {italic}{blue}%d ' .. (fail and '{red}' or '{green}') .. ' '
      )
   )
end

doPrompt()

bait.catch('command.exit', function(code)
   doPrompt(code ~= 0)
end)


bait.catch(
   'hilbish.vimMode',
   function(mode)
      if mode ~= 'insert' then
         ansikit.cursorStyle(ansikit.blockCursor)
      else
         ansikit.cursorStyle(ansikit.lineCursor)
      end
end
)

local aliases = {
   cat = "bat",
   vim = "lvim",
   ls = 'exa -al --icons --color=always --group-directories-first',
   la = 'exa -a --icons --color=always --group-directories-first',
   ll = 'exa -l --icons --color=always --group-directories-first',
   lt = 'exa -aT --icons --color=always --group-directories-first',
   pkupd = 'paru -Syyu',
   pkget = 'paru -S',
   pkrmv = 'paru -Rcns',
   pksrc = 'paru -Ss',
   pkcln = 'paru -Scc',
   tree = 'ls --tree',
   grep = 'grep --color=auto',
   egrep = 'egrep --color=auto',
   fgrep = 'fgrep --color=auto',
   neofetch = 'pfetch',
   addup = 'git add -u',
   addall = 'git add .',
   branch = 'git branch',
   checkout = 'git checkout',
   clone = 'git clone',
   commit = 'git commit -m',
   fetch = 'git fetch',
   pull = 'git pull origin',
   push = 'git push origin',
   stat = 'git status',
   tag = 'git tag',
   newtag = 'git tag -a',
   df = 'df -h',
   free = 'free -m',
   newsboat = 'newsboat -u ~/.config/newsboat/urls',
   fli = 'flix-cli',
   ani = 'ani-cli',
   aniq = 'ani-cli -q',
   mx = 'pulsemixer',
   amx = 'alsamixer',
   mk = 'cmus',
   ms = 'cmus',
   music = 'cmus',
   po = 'systemctl poweroff',
   sp = 'systemctl suspend',
   rb = 'systemctl reboot',
   fm ='$HOME/.config/vifm/scripts/vifmrun',
   file ='$HOME/.config/vifm/scripts/vifmrun',
   flm = '$HOME/.config/vifm/scripts/vifmrun',
   vifm = '$HOME/.config/vifm/scripts/vifmrun',
   rm = 'rm -vI',
   mv = 'mv -iv',
   cp = 'cp -iv',
   mkd = 'mkdir -pv',
   psa = 'ps auxf',
   psgrep = 'ps aux | grep -v grep | grep -i -e VSZ -e',
   psmem = 'ps auxf | sort -nr -k 4',
   pscpu = 'ps auxf | sort -nr -k 3',
   yta_aac = 'yt-dlp --extract-audio --audio-format aac',
   yta_best = 'yt-dlp --extract-audio --audio-format best',
   yta_flac = 'yt-dlp --extract-audio --audio-format flac',
   yta_m4a = 'yt-dlp --extract-audio --audio-format m4a',
   yta_mp3 = 'yt-dlp --extract-audio --audio-format mp3',
   yta_opus = 'yt-dlp --extract-audio --audio-format opus',
   yta_vorbis = 'yt-dlp --extract-audio --audio-format vorbis',
   yta_wav = 'yt-dlp --extract-audio --audio-format wav',
   ytv_best = 'yt-dlp -f bestvideo+bestaudio',
   yt = 'ytfzf -ftsl',
   ytm = 'ytfzf -mts',
   netstats = 'nmcli dev',
   wfi = 'nmtui-connect',
   wfi_scan = 'nmcli dev wifi rescan && nmcli dev wifi list',
   wfi_edit = 'nmtui-edit',
   wfi_on = 'nmcli radio wifi on',
   wfi_off = 'nmcli radio wifi off',
   blt = 'bluetoothct',
}

local function load_table (table)
   for cmd, new_cmd in pairs(table) do
      hilbish.alias(cmd, new_cmd)
   end
end

local function load_aliases ()
   load_table(aliases)
end

load_aliases()
