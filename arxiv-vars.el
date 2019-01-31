;; Defining the common variables for arxiv-mode

(defgroup arxiv nil
  "A mode for reading arXiv abstracts"
  :prefix "arxiv-"
  :group 'applications)

(defgroup arxiv-fontification nil
  "Faces for the arxiv mode"
  :group 'arxiv)

(defgroup arxiv-preferences nil
  "General preferences for the arxiv mode"
  :group 'arxiv)

(defvar arxiv-keyword-list-default nil
  "A list of highlighting keywords for arXiv mode.")

(defvar arxiv-mode-hook nil
  "A list of functions to call when entering arxiv-mode.")

(defvar arxiv-mode-map nil
  "Key map for arxiv-mode.")

(defvar arxiv-mode-syntax-table (make-syntax-table text-mode-syntax-table))

(defvar arxiv-highlight-overlays [nil nil nil])

(defvar arxiv-entry-list nil
  "Entries for arXiv articles.")

(defvar arxiv-current-entry nil
  "Current entry in the arXiv article list.")

(defvar arxiv-catagories 
  '(astro-ph cond-mat gr-qc hep-ex hep-lat hep-ph hep-th math-ph nlin nucl-ex nucl-th physics quant-ph
	     math corr q-bio q-fin stat eess econ)
  "availble categories in arXiv searching")

(defvar arxiv-subject-classifications
  '((astro-ph . Astrophysics)
    (astro-ph.CO . Cosmology_and_Nongalactic_Astrophysics)
    (astro-ph.EP . Earth_and_Planetary_Astrophysics)
    (astro-ph.GA . Astrophysics_of_Galaxies)
    (astro-ph.HE . High_Energy_Astrophysical_Phenomena)
    (astro-ph.IM . Instrumentation_and_Methods_for_Astrophysics)
    (astro-ph.SR . Solar_and_Stellar_Astrophysics)
    (cond-mat.dis-nn . Disordered_Systems_and_Neural_Networks)
    (cond-mat.mes-hall . Mesoscale_and_Nanoscale_Physics)
    (cond-mat.mtrl-sci . Materials_Science)
    (cond-mat.other . Other_Condensed_Matter)
    (cond-mat.quant-gas . Quantum_Gases)
    (cond-mat.soft . Soft_Condensed_Matter)
    (cond-mat.stat-mech . Statistical_Mechanics)
    (cond-mat.str-el . Strongly_Correlated_Electrons)
    (cond-mat.supr-con . Superconductivity)
    (cs.AI . Artificial_Intelligence)
    (cs.AR . Hardware_Architecture)
    (cs.CC . Computational_Complexity)
    (cs.CE . Computational_Engineering\,_Finance\,_and_Science)
    (cs.CG . Computational_Geometry)
    (cs.CL . Computation_and_Language)
    (cs.CR . Cryptography_and_Security)
    (cs.CV . Computer_Vision_and_Pattern_Recognition)
    (cs.CY . Computers_and_Society)
    (cs.DB . Databases)
    (cs.DC . Distributed\,_Parallel\,_and_Cluster_Computing)
    (cs.DL . Digital_Libraries)
    (cs.DM . Discrete_Mathematics)
    (cs.DS . Data_Structures_and_Algorithms)
    (cs.ET . Emerging_Technologies)
    (cs.FL . Formal_Languages_and_Automata_Theory)
    (cs.GL . General_Literature)
    (cs.GR . Graphics)
    (cs.GT . Computer_Science_and_Game_Theory)
    (cs.HC . Human-Computer_Interaction)
    (cs.IR . Information_Retrieval)
    (cs.IT . Information_Theory)
    (cs.LG . Machine_Learning)
    (cs.LO . Logic_in_Computer_Science)
    (cs.MA . Multiagent_Systems)
    (cs.MM . Multimedia)
    (cs.MS . Mathematical_Software)
    (cs.NA . Numerical_Analysis)
    (cs.NE . Neural_and_Evolutionary_Computing)
    (cs.NI . Networking_and_Internet_Architecture)
    (cs.OH . Other_Computer_Science)
    (cs.OS . Operating_Systems)
    (cs.PF . Performance)
    (cs.PL . Programming_Languages)
    (cs.RO . Robotics)
    (cs.SC . Symbolic_Computation)
    (cs.SD . Sound)
    (cs.SE . Software_Engineering)
    (cs.SI . Social_and_Information_Networks)
    (cs.SY . Systems_and_Control)
    (econ.EM . Econometrics)
    (eess.AS . Audio_and_Speech_Processing)
    (eess.IV . Image_and_Video_Processing)
    (eess.SP . Signal_Processing)
    (gr-qc . General_Relativity_and_Quantum_Cosmology)
    (hep-ex . High_Energy_Physics_-_Experiment)
    (hep-lat . High_Energy_Physics_-_Lattice)
    (hep-ph . High_Energy_Physics_-_Phenomenology)
    (hep-th . High_Energy_Physics_-_Theory)
    (math.AC . Commutative_Algebra)
    (math.AG . Algebraic_Geometry)
    (math.AP . Analysis_of_PDEs)
    (math.AT . Algebraic_Topology)
    (math.CA . Classical_Analysis_and_ODEs)
    (math.CO . Combinatorics)
    (math.CT . Category_Theory)
    (math.CV . Complex_Variables)
    (math.DG . Differential_Geometry)
    (math.DS . Dynamical_Systems)
    (math.FA . Functional_Analysis)
    (math.GM . General_Mathematics)
    (math.GN . General_Topology)
    (math.GR . Group_Theory)
    (math.GT . Geometric_Topology)
    (math.HO . History_and_Overview)
    (math.IT . Information_Theory)
    (math.KT . K-Theory_and_Homology)
    (math.LO . Logic)
    (math.MG . Metric_Geometry)
    (math.MP . Mathematical_Physics)
    (math.NA . Numerical_Analysis)
    (math.NT . Number_Theory)
    (math.OA . Operator_Algebras)
    (math.OC . Optimization_and_Control)
    (math.PR . Probability)
    (math.QA . Quantum_Algebra)
    (math.RA . Rings_and_Algebras)
    (math.RT . Representation_Theory)
    (math.SG . Symplectic_Geometry)
    (math.SP . Spectral_Theory)
    (math.ST . Statistics_Theory)
    (math-ph . Mathematical_Physics)
    (nlin.AO . Adaptation_and_Self-Organizing_Systems)
    (nlin.CD . Chaotic_Dynamics)
    (nlin.CG . Cellular_Automata_and_Lattice_Gases)
    (nlin.PS . Pattern_Formation_and_Solitons)
    (nlin.SI . Exactly_Solvable_and_Integrable_Systems)
    (nucl-ex . Nuclear_Experiment)
    (nucl-th . Nuclear_Theory)
    (physics.acc-ph . Accelerator_Physics)
    (physics.ao-ph . Atmospheric_and_Oceanic_Physics)
    (physics.app-ph . Applied_Physics)
    (physics.atm-clus . Atomic_and_Molecular_Clusters)
    (physics.atom-ph . Atomic_Physics)
    (physics.bio-ph . Biological_Physics)
    (physics.chem-ph . Chemical_Physics)
    (physics.class-ph . Classical_Physics)
    (physics.comp-ph . Computational_Physics)
    (physics.data-an . Data_Analysis\,_Statistics_and_Probability)
    (physics.ed-ph . Physics_Education)
    (physics.flu-dyn . Fluid_Dynamics)
    (physics.gen-ph . General_Physics)
    (physics.geo-ph . Geophysics)
    (physics.hist-ph . History_and_Philosophy_of_Physics)
    (physics.ins-det . Instrumentation_and_Detectors)
    (physics.med-ph . Medical_Physics)
    (physics.optics . Optics)
    (physics.plasm-ph . Plasma_Physics)
    (physics.pop-ph . Popular_Physics)
    (physics.soc-ph . Physics_and_Society)
    (physics.space-ph . Space_Physics)
    (q-bio.BM . Biomolecules)
    (q-bio.CB . Cell_Behavior)
    (q-bio.GN . Genomics)
    (q-bio.MN . Molecular_Networks)
    (q-bio.NC . Neurons_and_Cognition)
    (q-bio.OT . Other_Quantitative_Biology)
    (q-bio.PE . Populations_and_Evolution)
    (q-bio.QM . Quantitative_Methods)
    (q-bio.SC . Subcellular_Processes)
    (q-bio.TO . Tissues_and_Organs)
    (q-fin.CP . Computational_Finance)
    (q-fin.EC . Economics)
    (q-fin.GN . General_Finance)
    (q-fin.MF . Mathematical_Finance)
    (q-fin.PM . Portfolio_Management)
    (q-fin.PR . Pricing_of_Securities)
    (q-fin.RM . Risk_Management)
    (q-fin.ST . Statistical_Finance)
    (q-fin.TR . Trading_and_Market_Microstructure)
    (quant-ph . Quantum_Physics)
    (stat.AP . Applications)
    (stat.CO . Computation)
    (stat.ME . Methodology)
    (stat.ML . Machine_Learning)
    (stat.OT . Other_Statistics)
    (stat.TH . Statistics_Theory))
  "arXiv subjects alist for displaying.")

(defcustom arxiv-entries-per-page 100
  "Number of entries per page in the article list."
  :group 'arxiv-preferences
  :type 'integer)

(defcustom arxiv-default-browser "firefox"
  "Default browser for opening the arXiv url."
  :group 'arxiv-preferences
  :type 'string)

(defcustom arxiv-default-catagory "hep-th"
  "Default search catagory when using arxiv-read."
  :group 'arxiv-preferences
  :type 'string
  :options arxiv-catagories)

(defcustom arxiv-default-download-folder "~/Downloads"
  "Default download folder to save PDF file."
  :group 'arxiv-preferences
  :type 'string)


;; Defining custom faces
(defvar arxiv-title-face 'arxiv-title-face)
(defface arxiv-title-face 
  '((t (:inherit font-lock-keyword-face :height 1.2 :family "Lucida Grande")))
  "Face name for article titles in the arXiv article list."
  :group 'arxiv-fontification)

(defvar arxiv-keyword-face 'arxiv-keyword-face)
(defface arxiv-keyword-face
  '((t (:inherit font-lock-constant-face)))
  "Face name for keywords in the arXiv article list."
  :group 'arxiv-fontification)

(defvar arxiv-author-face 'arxiv-author-face)
(defface arxiv-author-face
  '((t (:inherit font-lock-type-face)))
  "Face name for authors in the arXiv article list."
  :group 'arxiv-fontification)

(defvar arxiv-abstract-face 'arxiv-abstract-face)
(defface arxiv-abstract-face
  '((t (:inherit font-lock-doc-face)))
  "Face name for abstract in the arXiv abstract viewing window."
  :group 'arxiv-fontification)

(defvar arxiv-subfield-face 'arxiv-subfield-face)
(defface arxiv-subfield-face
  '((t (:inherit default :height 0.9)))
  "Face name for subfields (comments, subjects, etc.) in the arXiv abstract viewing window."
  :group 'arxiv-fontification)

(defvar arxiv-subfield-face-bold 'arxiv-subfield-face-bold)
(defface arxiv-subfield-face-bold
  '((t (:inherit arxiv-subfield-face :weight semi-bold)))
  "This is the bold version of arxiv-subfield-face."
  :group 'arxiv-fontification)

(defvar arxiv-abstract-math-face 'arxiv-abstract-math-face)
(defface arxiv-abstract-math-face
  '((t (:inherit font-lock-reference-face :height 1.0 :family "Monospace")))
  "Face name for the latex content in abstract in the arXiv
abstract viewing window."
  :group 'arxiv-fontification)

(defvar arxiv-keyword-list-abstract nil
  "A list of highlighting keywords for arXiv abstract viewing mode")

(defvar arxiv-abstract-mode-hook nil
  "A list of functions to call when entering arxiv-abstract-mode.")

(defvar arxiv-abstract-syntax-table nil)
(setq arxiv-abstract-syntax-table
      (let ((synTable (make-syntax-table text-mode-syntax-table)))

        ;; bash style comment: “# …” 
        ;; (modify-syntax-entry ?# "< b" synTable)
        ;; (modify-syntax-entry ?\n "> b" synTable)
        (modify-syntax-entry ?$ "($" synTable)
        (modify-syntax-entry ?$ ")$" synTable)
        synTable))

(defvar arxiv-abstract-prettify-symbols-alist
  '( ;; Lowercase Greek letters.
    ("\\alpha" . ?α)
    ("\\beta" . ?β)
    ("\\gamma" . ?γ)
    ("\\delta" . ?δ)
    ("\\epsilon" . ?ϵ)
    ("\\zeta" . ?ζ)
    ("\\eta" . ?η)
    ("\\theta" . ?θ)
    ("\\iota" . ?ι)
    ("\\kappa" . ?κ)
    ("\\lambda" . ?λ)
    ("\\mu" . ?μ)
    ("\\nu" . ?ν)
    ("\\xi" . ?ξ)
    ;; There is no \omicron because it looks like a latin o.
    ("\\pi" . ?π)
    ("\\rho" . ?ρ)
    ("\\sigma" . ?σ)
    ("\\tau" . ?τ)
    ("\\upsilon" . ?υ)
    ("\\phi" . ?φ)
    ("\\chi" . ?χ)
    ("\\psi" . ?ψ)
    ("\\omega" . ?ω)
    ;; Uppercase Greek letters.
    ("\\Gamma" . ?Γ)
    ("\\Delta" . ?Δ)
    ("\\Lambda" . ?Λ)
    ("\\Phi" . ?Φ)
    ("\\Pi" . ?Π)
    ("\\Psi" . ?Ψ)
    ("\\Sigma" . ?Σ)
    ("\\Theta" . ?Θ)
    ("\\Upsilon" . ?Υ)
    ("\\Xi" . ?Ξ)
    ("\\Omega" . ?Ω)

    ;; Other math symbols (taken from leim/quail/latin-ltx.el).
    ("\\Box" . ?□)
    ("\\Bumpeq" . ?≎)
    ("\\Cap" . ?⋒)
    ("\\Cup" . ?⋓)
    ("\\Diamond" . ?◇)
    ("\\Downarrow" . ?⇓)
    ("\\H{o}" . ?ő)
    ("\\Im" . ?ℑ)
    ("\\Join" . ?⋈)
    ("\\Leftarrow" . ?⇐)
    ("\\Leftrightarrow" . ?⇔)
    ("\\Ll" . ?⋘)
    ("\\Lleftarrow" . ?⇚)
    ("\\Longleftarrow" . ?⇐)
    ("\\Longleftrightarrow" . ?⇔)
    ("\\Longrightarrow" . ?⇒)
    ("\\Lsh" . ?↰)
    ("\\Re" . ?ℜ)
    ("\\Rightarrow" . ?⇒)
    ("\\Rrightarrow" . ?⇛)
    ("\\Rsh" . ?↱)
    ("\\Subset" . ?⋐)
    ("\\Supset" . ?⋑)
    ("\\Uparrow" . ?⇑)
    ("\\Updownarrow" . ?⇕)
    ("\\Vdash" . ?⊩)
    ("\\Vert" . ?‖)
    ("\\Vvdash" . ?⊪)
    ("\\aleph" . ?ℵ)
    ("\\amalg" . ?∐)
    ("\\angle" . ?∠)
    ("\\approx" . ?≈)
    ("\\approxeq" . ?≊)
    ("\\ast" . ?∗)
    ("\\asymp" . ?≍)
    ("\\backcong" . ?≌)
    ("\\backepsilon" . ?∍)
    ("\\backprime" . ?‵)
    ("\\backsim" . ?∽)
    ("\\backsimeq" . ?⋍)
    ("\\backslash" . ?\\)
    ("\\barwedge" . ?⊼)
    ("\\because" . ?∵)
    ("\\beth" . ?ℶ)
    ("\\between" . ?≬)
    ("\\bigcap" . ?⋂)
    ("\\bigcirc" . ?◯)
    ("\\bigcup" . ?⋃)
    ("\\bigstar" . ?★)
    ("\\bigtriangledown" . ?▽)
    ("\\bigtriangleup" . ?△)
    ("\\bigvee" . ?⋁)
    ("\\bigwedge" . ?⋀)
    ("\\blacklozenge" . ?✦)
    ("\\blacksquare" . ?▪)
    ("\\blacktriangle" . ?▴)
    ("\\blacktriangledown" . ?▾)
    ("\\blacktriangleleft" . ?◂)
    ("\\blacktriangleright" . ?▸)
    ("\\bot" . ?⊥)
    ("\\bowtie" . ?⋈)
    ("\\boxminus" . ?⊟)
    ("\\boxplus" . ?⊞)
    ("\\boxtimes" . ?⊠)
    ("\\bullet" . ?•)
    ("\\bumpeq" . ?≏)
    ("\\cap" . ?∩)
    ("\\cdots" . ?⋯)
    ("\\centerdot" . ?·)
    ("\\checkmark" . ?✓)
    ("\\chi" . ?χ)
    ("\\cdot" . ?⋅)
    ("\\cdots" . ?⋯)
    ("\\circ" . ?∘)
    ("\\circeq" . ?≗)
    ("\\circlearrowleft" . ?↺)
    ("\\circlearrowright" . ?↻)
    ("\\circledR" . ?®)
    ("\\circledS" . ?Ⓢ)
    ("\\circledast" . ?⊛)
    ("\\circledcirc" . ?⊚)
    ("\\circleddash" . ?⊝)
    ("\\clubsuit" . ?♣)
    ("\\coloneq" . ?≔)
    ("\\complement" . ?∁)
    ("\\cong" . ?≅)
    ("\\coprod" . ?∐)
    ("\\cup" . ?∪)
    ("\\curlyeqprec" . ?⋞)
    ("\\curlyeqsucc" . ?⋟)
    ("\\curlypreceq" . ?≼)
    ("\\curlyvee" . ?⋎)
    ("\\curlywedge" . ?⋏)
    ("\\curvearrowleft" . ?↶)
    ("\\curvearrowright" . ?↷)
    ("\\dag" . ?†)
    ("\\dagger" . ?†)
    ("\\daleth" . ?ℸ)
    ("\\dashv" . ?⊣)
    ("\\ddag" . ?‡)
    ("\\ddagger" . ?‡)
    ("\\ddots" . ?⋱)
    ("\\diamond" . ?⋄)
    ("\\diamondsuit" . ?♢)
    ("\\divideontimes" . ?⋇)
    ("\\doteq" . ?≐)
    ("\\doteqdot" . ?≑)
    ("\\dotplus" . ?∔)
    ("\\dotsquare" . ?⊡)
    ("\\downarrow" . ?↓)
    ("\\downdownarrows" . ?⇊)
    ("\\downleftharpoon" . ?⇃)
    ("\\downrightharpoon" . ?⇂)
    ("\\ell" . ?ℓ)
    ("\\emptyset" . ?∅)
    ("\\eqcirc" . ?≖)
    ("\\eqcolon" . ?≕)
    ("\\eqslantgtr" . ?⋝)
    ("\\eqslantless" . ?⋜)
    ("\\equiv" . ?≡)
    ("\\exists" . ?∃)
    ("\\fallingdotseq" . ?≒)
    ("\\flat" . ?♭)
    ("\\forall" . ?∀)
    ("\\frown" . ?⌢)
    ("\\ge" . ?≥)
    ("\\geq" . ?≥)
    ("\\geqq" . ?≧)
    ("\\geqslant" . ?≥)
    ("\\gets" . ?←)
    ("\\gg" . ?≫)
    ("\\ggg" . ?⋙)
    ("\\gimel" . ?ℷ)
    ("\\gnapprox" . ?⋧)
    ("\\gneq" . ?≩)
    ("\\gneqq" . ?≩)
    ("\\gnsim" . ?⋧)
    ("\\gtrapprox" . ?≳)
    ("\\gtrdot" . ?⋗)
    ("\\gtreqless" . ?⋛)
    ("\\gtreqqless" . ?⋛)
    ("\\gtrless" . ?≷)
    ("\\gtrsim" . ?≳)
    ("\\gvertneqq" . ?≩)
    ("\\hbar" . ?ℏ)
    ("\\heartsuit" . ?♥)
    ("\\hookleftarrow" . ?↩)
    ("\\hookrightarrow" . ?↪)
    ("\\iff" . ?⇔)
    ("\\imath" . ?ı)
    ("\\in" . ?∈)
    ("\\infty" . ?∞)
    ("\\int" . ?∫)
    ("\\intercal" . ?⊺)
    ("\\langle" . 10216)          ; Literal ?⟨ breaks indentation.
    ("\\lbrace" . ?{)
    ("\\lbrack" . ?\[)
    ("\\lceil" . ?⌈)
    ("\\ldots" . ?…)
    ("\\le" . ?≤)
    ("\\leadsto" . ?↝)
    ("\\leftarrow" . ?←)
    ("\\leftarrowtail" . ?↢)
    ("\\leftharpoondown" . ?↽)
    ("\\leftharpoonup" . ?↼)
    ("\\leftleftarrows" . ?⇇)
    ;; ("\\leftparengtr" ?〈), see bug#12948.
    ("\\leftrightarrow" . ?↔)
    ("\\leftrightarrows" . ?⇆)
    ("\\leftrightharpoons" . ?⇋)
    ("\\leftrightsquigarrow" . ?↭)
    ("\\leftthreetimes" . ?⋋)
    ("\\leq" . ?≤)
    ("\\leqq" . ?≦)
    ("\\leqslant" . ?≤)
    ("\\lessapprox" . ?≲)
    ("\\lessdot" . ?⋖)
    ("\\lesseqgtr" . ?⋚)
    ("\\lesseqqgtr" . ?⋚)
    ("\\lessgtr" . ?≶)
    ("\\lesssim" . ?≲)
    ("\\lfloor" . ?⌊)
    ("\\lhd" . ?◁)
    ("\\rhd" . ?▷)
    ("\\ll" . ?≪)
    ("\\llcorner" . ?⌞)
    ("\\lnapprox" . ?⋦)
    ("\\lneq" . ?≨)
    ("\\lneqq" . ?≨)
    ("\\lnsim" . ?⋦)
    ("\\longleftarrow" . ?←)
    ("\\longleftrightarrow" . ?↔)
    ("\\longmapsto" . ?↦)
    ("\\longrightarrow" . ?→)
    ("\\looparrowleft" . ?↫)
    ("\\looparrowright" . ?↬)
    ("\\lozenge" . ?✧)
    ("\\lq" . ?‘)
    ("\\lrcorner" . ?⌟)
    ("\\ltimes" . ?⋉)
    ("\\lvertneqq" . ?≨)
    ("\\maltese" . ?✠)
    ("\\mapsto" . ?↦)
    ("\\measuredangle" . ?∡)
    ("\\mho" . ?℧)
    ("\\mid" . ?∣)
    ("\\models" . ?⊧)
    ("\\mp" . ?∓)
    ("\\multimap" . ?⊸)
    ("\\nLeftarrow" . ?⇍)
    ("\\nLeftrightarrow" . ?⇎)
    ("\\nRightarrow" . ?⇏)
    ("\\nVDash" . ?⊯)
    ("\\nVdash" . ?⊮)
    ("\\nabla" . ?∇)
    ("\\napprox" . ?≉)
    ("\\natural" . ?♮)
    ("\\ncong" . ?≇)
    ("\\ne" . ?≠)
    ("\\nearrow" . ?↗)
    ("\\neg" . ?¬)
    ("\\neq" . ?≠)
    ("\\nequiv" . ?≢)
    ("\\newline" . ? )
    ("\\nexists" . ?∄)
    ("\\ngeq" . ?≱)
    ("\\ngeqq" . ?≱)
    ("\\ngeqslant" . ?≱)
    ("\\ngtr" . ?≯)
    ("\\ni" . ?∋)
    ("\\nleftarrow" . ?↚)
    ("\\nleftrightarrow" . ?↮)
    ("\\nleq" . ?≰)
    ("\\nleqq" . ?≰)
    ("\\nleqslant" . ?≰)
    ("\\nless" . ?≮)
    ("\\nmid" . ?∤)
    ;; ("\\not" ?̸)              ;FIXME: conflict with "NOT SIGN" ¬.
    ("\\notin" . ?∉)
    ("\\nparallel" . ?∦)
    ("\\nprec" . ?⊀)
    ("\\npreceq" . ?⋠)
    ("\\nrightarrow" . ?↛)
    ("\\nshortmid" . ?∤)
    ("\\nshortparallel" . ?∦)
    ("\\nsim" . ?≁)
    ("\\nsimeq" . ?≄)
    ("\\nsubset" . ?⊄)
    ("\\nsubseteq" . ?⊈)
    ("\\nsubseteqq" . ?⊈)
    ("\\nsucc" . ?⊁)
    ("\\nsucceq" . ?⋡)
    ("\\nsupset" . ?⊅)
    ("\\nsupseteq" . ?⊉)
    ("\\nsupseteqq" . ?⊉)
    ("\\ntriangleleft" . ?⋪)
    ("\\ntrianglelefteq" . ?⋬)
    ("\\ntriangleright" . ?⋫)
    ("\\ntrianglerighteq" . ?⋭)
    ("\\nvDash" . ?⊭)
    ("\\nvdash" . ?⊬)
    ("\\nwarrow" . ?↖)
    ("\\odot" . ?⊙)
    ("\\oint" . ?∮)
    ("\\ominus" . ?⊖)
    ("\\oplus" . ?⊕)
    ("\\oslash" . ?⊘)
    ("\\otimes" . ?⊗)
    ("\\par" . ? )
    ("\\parallel" . ?∥)
    ("\\partial" . ?∂)
    ("\\perp" . ?⊥)
    ("\\pitchfork" . ?⋔)
    ("\\prec" . ?≺)
    ("\\precapprox" . ?≾)
    ("\\preceq" . ?≼)
    ("\\precnapprox" . ?⋨)
    ("\\precnsim" . ?⋨)
    ("\\precsim" . ?≾)
    ("\\prime" . ?′)
    ("\\prod" . ?∏)
    ("\\propto" . ?∝)
    ("\\qed" . ?∎)
    ("\\qquad" . ?⧢)
    ("\\quad" . ?␣)
    ("\\rangle" . 10217)            ; Literal ?⟩ breaks indentation.
    ("\\rbrace" . ?})
    ("\\rbrack" . ?\])
    ("\\rceil" . ?⌉)
    ("\\rfloor" . ?⌋)
    ("\\rightarrow" . ?→)
    ("\\rightarrowtail" . ?↣)
    ("\\rightharpoondown" . ?⇁)
    ("\\rightharpoonup" . ?⇀)
    ("\\rightleftarrows" . ?⇄)
    ("\\rightleftharpoons" . ?⇌)
    ;; ("\\rightparengtr" ?⦔) ;; Was ?〉, see bug#12948.
    ("\\rightrightarrows" . ?⇉)
    ("\\rightthreetimes" . ?⋌)
    ("\\risingdotseq" . ?≓)
    ("\\rtimes" . ?⋊)
    ("\\times" . ?×)
    ("\\sbs" . ?﹨)
    ("\\searrow" . ?↘)
    ("\\setminus" . ?∖)
    ("\\sharp" . ?♯)
    ("\\shortmid" . ?∣)
    ("\\shortparallel" . ?∥)
    ("\\sim" . ?∼)
    ("\\simeq" . ?≃)
    ("\\smallamalg" . ?∐)
    ("\\smallsetminus" . ?∖)
    ("\\smallsmile" . ?⌣)
    ("\\smile" . ?⌣)
    ("\\spadesuit" . ?♠)
    ("\\sphericalangle" . ?∢)
    ("\\sqcap" . ?⊓)
    ("\\sqcup" . ?⊔)
    ("\\sqsubset" . ?⊏)
    ("\\sqsubseteq" . ?⊑)
    ("\\sqsupset" . ?⊐)
    ("\\sqsupseteq" . ?⊒)
    ("\\square" . ?□)
    ("\\squigarrowright" . ?⇝)
    ("\\star" . ?⋆)
    ("\\straightphi" . ?φ)
    ("\\subset" . ?⊂)
    ("\\subseteq" . ?⊆)
    ("\\subseteqq" . ?⊆)
    ("\\subsetneq" . ?⊊)
    ("\\subsetneqq" . ?⊊)
    ("\\succ" . ?≻)
    ("\\succapprox" . ?≿)
    ("\\succcurlyeq" . ?≽)
    ("\\succeq" . ?≽)
    ("\\succnapprox" . ?⋩)
    ("\\succnsim" . ?⋩)
    ("\\succsim" . ?≿)
    ("\\sum" . ?∑)
    ("\\supset" . ?⊃)
    ("\\supseteq" . ?⊇)
    ("\\supseteqq" . ?⊇)
    ("\\supsetneq" . ?⊋)
    ("\\supsetneqq" . ?⊋)
    ("\\surd" . ?√)
    ("\\swarrow" . ?↙)
    ("\\therefore" . ?∴)
    ("\\thickapprox" . ?≈)
    ("\\thicksim" . ?∼)
    ("\\to" . ?→)
    ("\\top" . ?⊤)
    ("\\triangle" . ?▵)
    ("\\triangledown" . ?▿)
    ("\\triangleleft" . ?◃)
    ("\\trianglelefteq" . ?⊴)
    ("\\triangleq" . ?≜)
    ("\\triangleright" . ?▹)
    ("\\trianglerighteq" . ?⊵)
    ("\\twoheadleftarrow" . ?↞)
    ("\\twoheadrightarrow" . ?↠)
    ("\\ulcorner" . ?⌜)
    ("\\uparrow" . ?↑)
    ("\\updownarrow" . ?↕)
    ("\\upleftharpoon" . ?↿)
    ("\\uplus" . ?⊎)
    ("\\uprightharpoon" . ?↾)
    ("\\upuparrows" . ?⇈)
    ("\\urcorner" . ?⌝)
    ("\\u{i}" . ?ĭ)
    ("\\vDash" . ?⊨)
    ("\\varepsilon" . ?ε)
    ("\\varprime" . ?′)
    ("\\varpropto" . ?∝)
    ("\\varrho" . ?ϱ)
    ;; ("\\varsigma" ?ς)		;FIXME: Looks reversed with the non\var.
    ("\\vartriangleleft" . ?⊲)
    ("\\vartriangleright" . ?⊳)
    ("\\vdash" . ?⊢)
    ("\\vdots" . ?⋮)
    ("\\vee" . ?∨)
    ("\\veebar" . ?⊻)
    ("\\vert" . ?|)
    ("\\wedge" . ?∧)
    ("\\wp" . ?℘)
    ("\\wr" . ?≀)
    ("\\Bbb{N}" . ?ℕ)			; AMS commands for blackboard bold
    ("\\Bbb{P}" . ?ℙ)			; Also sometimes \mathbb.
    ("\\Bbb{Q}" . ?ℚ)
    ("\\Bbb{R}" . ?ℝ)
    ("\\Bbb{Z}" . ?ℤ)
    ("--" . ?–)
    ("---" . ?—)
    ("\\ordfeminine" . ?ª)
    ("\\ordmasculine" . ?º)
    ("\\lambdabar" . ?ƛ)
    ("\\celsius" . ?℃)
    ("\\textmu" . ?µ)
    ("\\textfractionsolidus" . ?⁄)
    ("\\textbigcircle" . ?⃝)
    ("\\textmusicalnote" . ?♪)
    ("\\textdied" . ?✝)
    ("\\textcolonmonetary" . ?₡)
    ("\\textwon" . ?₩)
    ("\\textnaira" . ?₦)
    ("\\textpeso" . ?₱)
    ("\\textlira" . ?₤)
    ("\\textrecipe" . ?℞)
    ("\\textinterrobang" . ?‽)
    ("\\textpertenthousand" . ?‱)
    ("\\textbaht" . ?฿)
    ("\\textnumero" . ?№)
    ("\\textdiscount" . ?⁒)
    ("\\textestimated" . ?℮)
    ("\\textopenbullet" . ?◦)
    ("\\textlquill" . 8261)		; Literal ?⁅ breaks indentation.
    ("\\textrquill" . 8262)             ; Literal ?⁆ breaks indentation.
    ("\\textcircledP" . ?℗)
    ("\\textreferencemark" . ?※))
  "A `prettify-symbols-alist' used when viewing math source code. Taken from for tex-mode.el.")


(provide 'arxiv-vars)

;; end of arxiv-vars.el
