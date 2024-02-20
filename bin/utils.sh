#!/usr/bin/env bash

function java::war::find_war() {
    # Tries to find a .war file in the project directory.
    #
    # We only search in the project dir, **not** in its subdirectories.
    # The first .war file is considered and WAR_PATH is set to the file name.
    #
    # Globals:
    #   HOME
    #   WAR_PATH
    #
    # Returns:
    #   0 when successful, 1 otherwise

    local rc=1
    local war_path

    war_path="$( find "${HOME}" \
                    -nowarn \
                    -maxdepth 1 \
                    -iname "*.war" \
                    -type f \
                    -printf "%P" \
                    -quit )"

    if [ -n "${war_path}" ]; then
        cat << EOF
The platform will try to start with '${war_path}', found in the root directory
of your project.
If it's not the right file, please use the WAR_PATH environment variable to
point to the one you want to use.
The path must be relative to your project root directory.
EOF

        WAR_PATH="${war_path}"
        export WAR_PATH
        rc=0
    else
        cat << EOF >&2
We couldn't figure out which .war file to start.
Please set the WAR_PATH environment variable to the path of your war file.
The path must be relative to your project root directory.
EOF
    fi

    return "${rc}"
}
