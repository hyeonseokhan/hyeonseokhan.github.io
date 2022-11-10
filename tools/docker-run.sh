#!/usr/bin/env bash
#
# Run jekyll serve and then launch the site

# bundle exec jekyll s -H 0.0.0.0 -l
#docker run -it --rm \
#--volume="$PWD:/srv/jekyll" \
#-p 4000:4000 jekyll/jekyll \
#jekyll serve

docker run -it --rm \
-p 4000:4000 \
-v ${PWD}:/srv/jekyll \
--name blog jekyll/jekyll \
jekyll serve

#docker run -d \
#-p 4000:4000 \
#-v ${PWD}:/srv/jekyll \
#--name blog jekyll/jekyll \
#jekyll serve
