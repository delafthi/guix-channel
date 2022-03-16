(define-module (delafthi packages rust-apps)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg))

(define-public hacksaw
  (package
    (name "hacksaw")
    (version "master")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/neXromancers/hacksaw")
          (commit version)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "197cpr4bsf7c0ij5xwd1rl8xwsmknd5hv3zqi8fhmar98x1dfvi0"))))
    (build-system cargo-build-system)
    (arguments 
      `(#:cargo-inputs
        (("rust-structopt" ,rust-structopt-0.3)
         ("rust-xcb" ,rust-xcb-0.9))))
    (inputs
      `(("libx11" ,libx11)
        ("libxrandr" ,libxrandr)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("python" ,python)))
    (home-page "https://github.com/neXromancers/hacksaw")
    (synopsis "Select areas of your X screen")
    (description "Hacksaw lets you select areas of your X screen and pipe
the selection to other programs")
    (license license:mpl2.0)))

(define-public shotgun
  (package
    (name "shotgun")
    (version "2.2.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/neXromancers/shotgun")
          (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "14n126crxc3l5b5y3hd0aj6p49k0zdys859ml0gvxxbc4gz0ym0a"))))
    (build-system cargo-build-system)
    (arguments 
      `(#:cargo-inputs
        (("rust-getopts" ,rust-getopts-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-image" ,rust-image-0.23)
         ("rust-x11" ,rust-x11-2))))
    (inputs
      `(("libx11" ,libx11)
        ("libxrandr" ,libxrandr)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("git" ,git)))
    (home-page "https://github.com/neXromancers/shotgun")
    (synopsis "Minimal X screenshot utility")
    (description "Shotgun is a minimal screenshot utility, which lets you
capture a given section of the screen")
    (license license:mpl2.0)))
