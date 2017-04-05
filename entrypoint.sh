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

SEARCH="<raml-initializer><\/raml-initializer>"
REPLACE="<raml-console-loader src=\"raml\/$MAIN_RAML_PATH\" options=\"$OPTIONS\"><\/raml-console-loader>"

sed -i "s/$SEARCH/$REPLACE/g" /app/index.html
sed -i 's|/usr/share/nginx/html|/app|g' /etc/nginx/conf.d/default.conf

exec /usr/sbin/nginx -g "daemon off;"
