#!/bin/bash

OPTIONS_FILE="/options.conf"

if [ -f $OPTIONS_FILE ]; then
  source $OPTIONS_FILE
fi

OPTIONS=$(cat <<EOF
{
  singleView: ${singleView:-false},
  disableThemeSwitcher: ${disableThemeSwitcher:-true},
  disableRamlClientGenerator: ${disableRamlClientGenerator:-true},
  resourcesCollapsed: ${resourcesCollapsed:-true},
  documentationCollapsed: ${documentationCollapsed:-false},
  allowUnsafeMarkdown: ${allowUnsafeMarkdown:-false},
  disableTryIt: ${disableTryIt:-true}
}
EOF
)

OPTIONS=$(echo $OPTIONS | sed 's/ \{1,\}/ /g')

SEARCH_APP="<raml-initializer><\/raml-initializer>"
REPLACE_APP="<raml-console-loader src=\"raml\/$MAIN_RAML_PATH\" options=\"$OPTIONS\"><\/raml-console-loader>"

SEARCH_TITLE="<title>API Console</title>"
REPLACE_TITLE="<title>$PAGE_TITLE</title>"

sed -i "s/$SEARCH_APP/$REPLACE_APP/g" /app/index.html
sed -i "s|$SEARCH_TITLE|$REPLACE_TITLE|g" /app/index.html
sed -i 's|/usr/share/nginx/html|/app|g' /etc/nginx/conf.d/default.conf

exec /usr/sbin/nginx -g "daemon off;"
