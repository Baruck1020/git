make_mbox_with_nul () {
	space=' '
	q_nul_in_subject=
	q_nul_in_body=
	while test $# -ne 0
	do
		case "$1" in
		subject) q_nul_in_subject='=00' ;;
		body)    q_nul_in_body='=00' ;;
		esac &&
		shift
	done &&
	cat <<-EOF
	From ec7364544f690c560304f5a5de9428ea3b978b26 Mon Sep 17 00:00:00 2001
	From: A U Thor <author@example.com>
	Date: Sun, 19 Apr 2020 13:42:07 +0700
	Subject: [PATCH] =?ISO-8859-1?q?=C4=CB${q_nul_in_subject}=D1=CF=D6?=
	MIME-Version: 1.0
	Content-Type: text/plain; charset=ISO-8859-1
	Content-Transfer-Encoding: quoted-printable

	abc${q_nul_in_body}def
	---
	diff --git a/afile b/afile
	new file mode 100644
	index 0000000000..e69de29bb2
	--$space
	2.26.1
	EOF
}
