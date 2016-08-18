# tomcat 8 and xwiki with defaults
#
# Be advised: XWiki won't run as-is. The database is not configured.
# Browsing to XWiki will fail with a java.lang.ClassNotFoundException: org.hsqldb.jdbcDriver.
#
# You'll want to do at least the following :
# - Edit $XWIKI_ROOT/WEB-INF/hibernate.cfg.xml
# - Add a JDBC41 JAR for your database system in $XWIKI_ROOT/WEB-INF/lib/

# XWiki does not currently support more recent tomcat versions because of a bug.
FROM tomcat:8.5.0
# See: http://platform.xwiki.org/xwiki/bin/view/AdminGuide/InstallationTomcat
# See: http://jira.xwiki.org/browse/XWIKI-13556

# XWiki will be installed in the default webapps root
ENV XWIKI_ROOT="$CATALINA_HOME/webapps/ROOT"

# Download and manually instead of relying on tomcat's autoexpansion
RUN wget -nv "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-8.2.1.war" -O "/tmp/xwiki.war" \
    && rm -rf "$XWIKI_ROOT" \
    && mkdir -p "$XWIKI_ROOT" \
    && unzip "/tmp/xwiki.war" -d "$XWIKI_ROOT" \
    && rm "/tmp/xwiki.war"

COPY ["server.xml", "context.xml", "$CATALINA_HOME/conf/"]