# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit java-utils-2

DESCRIPTION="Apache HttpComponents Core"
HOMEPAGE="http://hc.apache.org/index.html"
SRC_URI="mirror://apache/httpcomponents/httpclient/binary/${P/-bin/}-bin.tar.gz"

LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64"
IUSE="doc"

RDEPEND=">=virtual/jre-1.5"

S="${WORKDIR}/${P/-bin/}"

# Oddly enough version 4.2.2 is bundled, not ${PV}
HTTPCORE_PV="4.2.2"

src_install() {
	java-pkg_newjar "lib/httpclient-${PV}.jar" httpclient.jar
	java-pkg_newjar "lib/httpclient-cache-${PV}.jar" httpclient-cache.jar
	java-pkg_newjar "lib/httpcore-${HTTPCORE_PV}.jar" httpcore.jar
	java-pkg_newjar "lib/httpmime-${PV}.jar" httpmime.jar
	use doc && java-pkg_dojavadoc javadoc
}
