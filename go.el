(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("SciComp"
         :base-directory "org/"
         :base-extension "org"
         :publishing-directory "~/Documents/github/SciComp/html"
         :publishing-function org-publish-org-to-html
         :recursive t
         :htmlized-source t
         :section-numbers nil
         :html-postamble "<hr />%a | %d<br>This <span xmlns:dct=\"http://purl.org/dc/terms/\" href=\"http://purl.org/dc/dcmitype/Text\" rel=\"dct:type\">work</span> is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/\">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a><br><a rel=\"license\"href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"http://i.creativecommons.org/l/by-nc-sa/3.0/80x15.png\" /></a><br />"
         :language en
         :link-home "index.html"
         :link-up "index.html"
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\" />"
         )
        ("SciComp_html"
         :base-directory "html/"
         :base-extension "css\\|html"
         :publishing-directory "/ssh:admin@leviathan.ssc.uwo.ca:~/gribblelab.org/SciComp/"
         :publishing-function org-publish-attachment
         :recursive t
         )
        ("SciComp_code"
         :base-directory "code/"
         :base-extension "m\\|r\\|py\\|c\\|h\\|txt\\|csv\\|xls\\|jpg\\|pdf\\|tex\\|bib\\|png\\|tgz\\|MOV"
         :publishing-directory "/ssh:admin@leviathan.ssc.uwo.ca:~/gribblelab.org/SciComp/code/"
         :publishing-function org-publish-attachment
         :recursive t
         )
        ("org" :components ("SciComp" "SciComp_html" "SciComp_code"))))

(org-publish-project "SciComp")
(org-publish-project "SciComp_html")
(org-publish-project "SciComp_code")
