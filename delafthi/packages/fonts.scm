(define-module (delafthi packages fonts)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font))

(define-public nerd-fonts-victor-mono
  (package
    (name "nerd-fonts-victor-mono")
    (version "2.1.0")
    (source 
      (origin
        (method url-fetch/zipbomb)
        (uri (string-append
          "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
          version
          "/VictorMono.zip"))
        (sha256 
          (base32 "18z92kwggfqwrd5m09yda55hcb4b159278lps6f9hr8icwki6v9q"))))
    (build-system font-build-system)
    (synopsis "Font with support for italics and ligatures")
    (description "Patched font Victor Mono from nerd-fonts.")
    (home-page "https://github.com/ryanoasis/nerd-fonts/")
    (license license:expat)))
