# Create an ssh auth sock tunnel with Windows' OpenSSH
function create_ssh_socket
    if test -z "$WSL_DISTRO_NAME"
        return
    end
    if not test -x "$(which socat 2>/dev/null)"
        return
    end
    if not ss -axn | grep -q $SSH_AUTH_SOCK
        rm -f $SSH_AUTH_SOCK
        socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/usr/local/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &
        disown (pidof socat)
    end
end


if status is-login
    create_ssh_socket
end
