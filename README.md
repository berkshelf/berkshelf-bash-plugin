Berkshelf Bash Plugin
=====================
The `berkshelf-bash-plugin` is a bash plugin for [Berkshelf](https://github.com/berkshelf/berkshelf).


Installation
------------
### Homebrew
1. Install homebrew bash completions:

        brew install bash-completion # if you haven't already

2. Download the bash completion script into homebrew's completions directory:

        (cd `brew --prefix`/etc/bash_completion.d && curl https://raw.github.com/berkshelf/berkshelf-bash-plugin/master/berkshelf-complete.sh > berkshelf-complete.sh)

3. Ensure you `source` this file in your `.bash_profile` or `.bashrc`:

        [ -f `brew --prefix`/etc/bash_completion ] && source `brew --prefix`/etc/bash_completion

### Linux
1. Create a directory to store bash completions:

        mkdir -p ~/.bash-completions

2. Download the latest bash completion script into the user's home directory:

        curl https://raw.github.com/berkshelf/berkshelf-bash-plugin/master/berkshelf-complete.sh > ~/.bash-completions/berkshelf-complete.sh

3. Source the completion script in the `.bash_profile` or `.bashrc`:

        source ~/.bash-completions/berkshelf-complete.sh


License & Authors
-----------------
- Seth Vargo (<sethvargo@gmail.com>)

```text
Copyright 2013-2014 Seth Vargo <sethvargo@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
