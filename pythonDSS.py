import xml.dom.minidom
from html import escape

# Charger le fichier XML des artistes
dom = xml.dom.minidom.parse('artisteDevoir2.xml')
racine = dom.documentElement
artistes = racine.getElementsByTagName('artiste')

# Générer le fichier HTML
with open("liste_artistes.html", "w") as fichier_html:
    fichier_html.write("<html>")
    fichier_html.write("<head>")
    fichier_html.write("<title>Liste des artistes</title>")
    fichier_html.write("</head>")
    fichier_html.write("<body>")
    fichier_html.write('<p>Ce travail a été réaliser par Belhaddad chawki et Mehdid samy. Groupe:01 </p>')
    fichier_html.write("<h1>Ma liste d'artistes</h1>")

    for artiste in artistes:
        nom = artiste.getAttribute('nom')
        ville = artiste.getAttribute('ville')
        sites = artiste.getElementsByTagName('site')
        albums = racine.getElementsByTagName('album')

        fichier_html.write('<h2 style="color: crimson;">NOM: {}</h2>'.format(escape(nom)))
        fichier_html.write("<h3>Ville: {}</h3>".format(escape(ville)))

        if sites:
            site = sites[0]
            url = site.getAttribute('url')
            fichier_html.write('<h3 > Site: <a href="{}">{}</a></h3>'.format(escape(url), escape(url)))
        
        fichier_html.write('<h3>Productions</h3>')
        fichier_html.write('<table border="1" style="border-color: rgb(12, 188, 106);">')
        for album in albums:
            ref_artiste = album.getElementsByTagName('ref-artiste')[0]
            if ref_artiste.getAttribute('ref') == artiste.getAttribute('no'):
                titre_album = album.getElementsByTagName('titre')[0].childNodes[0].nodeValue
                chanson = album.getElementsByTagName('chanson')[0].childNodes[0].nodeValue
                fichier_html.write('<tr><th>Nom de l\'album</th><th>Chanson</th></tr>')
                fichier_html.write('<tr><td>{}</td><td>{}</td></tr>'.format(escape(titre_album), escape(chanson)))

        fichier_html.write('</table>')

    fichier_html.write("</body>")
    fichier_html.write("</html>")