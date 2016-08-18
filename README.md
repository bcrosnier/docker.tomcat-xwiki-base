# Non-functional XWiki image base
**Be advised: XWiki won't run as-is.** The database is not configured.

## [View Dockerfile](https://github.com/bcrosnier/docker.tomcat-xwiki-base/blob/master/Dockerfile)

Used as base to derive other XWiki images from.

This image sets up the `server.xml` used by tomcat and downloads XWiki in the `ROOT` webapp directory.

# Usage

1. Create another image from this one
2. Add a JDBC41 JAR for your database system in `$XWIKI_ROOT/WEB-INF/lib/`
3. Edit at least `$XWIKI_ROOT/WEB-INF/hibernate.cfg.xml`, unless you plan on using all defaults (file-based hsql)
4. Run your image
5. Head on to your configured port, eg. `http://localhost:8080/`

## Env. variables

- `XWIKI_ROOT`: Root directory of the xwiki webapp: `/usr/local/tomcat/webapps/ROOT/`

## Exposed ports

- `8080`: Tomcat port (from `tomcat`)