if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    export EDITOR=vim
    function y
    	set tmp (mktemp -t "yazi-cwd.XXXXXX")
    	yazi $argv --cwd-file="$tmp"
    	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    		builtin cd -- "$cwd"
    	end
    	rm -f -- "$tmp"
    end
end
