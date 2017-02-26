#!/bin/bash

OPTIONS=$(cat <<-EOF
{
    singleView: $SINGLE_VIEW,
    disableThemeSwitcher: $DISABLE_THEME_SWITCHER,
    disableRamlClientGenerator: $DISABLE_RAML_CLIENT_GENERATOR,
    resourcesCollapsed: $RESOURCES_COLLAPSED,
    documentationCollapsed: $DOCUMENTATION_COLLAPSED,
    allowUnsafeMarkdown: $ALLOW_UNSAFE_MARKDOWN,
    disableTryIt: $DISABLE_TRY_IT
}
EOF
)

SRC_PATH="apis/$INDEX_FILE"

SEARCH="<raml-initializer></raml-initializer>"
REPLACE="<raml-console-loader src='$SRC_PATH' options='$OPTIONS'></raml-console-loader>"

sed -i "s#$SEARCH#$REPLACE#g" /usr/share/nginx/html/index.html

exec /usr/sbin/nginx -g "daemon off;"
