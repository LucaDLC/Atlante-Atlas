/* Manifesto dell'atlante IML: menu, calendario, scadenze, orari e data d'esame.
   Per aggiungere una pagina: crea il file e aggiungi { t:'Titolo', h:'teoria/nome.html' } nel gruppo giusto.
   Una voce senza pagina ancora pronta: { t:'Titolo', arriva:'21 set' }. */
try { const t = localStorage.getItem('atlante:tema'); if (t) document.documentElement.dataset.theme = t; } catch (e) { }

window.SITO = {
  sigla: 'IML',
  nome: 'Introduction to Machine Learning',
  /* Finestra ufficiale dell'orale: 11–19 gennaio 2027. Il turno di ognuno esce prima di Natale. */
  esame: { data: '2027-01-11T09:00', etichetta: 'orale di 30 minuti: primo giorno della finestra 11–19 gennaio (il tuo turno esce prima di Natale)' },


  lezioneDopo: 4,   // giorni tra la data del calendario (lunedì) e il giorno di lezione
  calendario: [
    { da: '2026-08-24', t: 'L1 · Introduzione, dati e vettori', sub: 'SH 1–2.5 · ST 1.1–1.2 · DW cap. 1', h: 'teoria/w01-equazioni-modello.html' },
    { da: '2026-08-31', t: 'L2 · Algebra lineare, matrici e soluzioni', sub: 'ST 1.3–1.4, 2.2, 2.4 · formare i gruppi · data collection', h: 'teoria/w02-dati-come-vettori.html' },
    { da: '2026-09-07', t: 'L3 · Inversa e trasformazioni', sub: 'ST 3.1, 3.4 · DW 3–5.3 · esercizio obbligatorio', h: 'teoria/w03-matrici.html' },
    { da: '2026-09-14', t: 'L4 · Minimi quadrati e sistemi sovradeterminati', sub: 'SH 4.1–4.3 · DW 5.4 e cap. 6 · esercizio obbligatorio', h: 'teoria/w04-trasformazioni.html' },
    { da: '2026-09-21', t: 'L5 · Kernel e basi', sub: 'DW 7, 9, 10 · ST 3.4, 4.2, 4.3', h: 'teoria/w05-kernel.html' },
    { da: '2026-09-28', t: 'L6 · Rumore e generalizzazione', sub: 'in-class test 1 (primi 30–45 min della lezione) · parte Assignment 1 — Gaze Estimation · DW 8, 11–12', h: 'teoria/w06-rumore-generalizzazione.html' },
    { da: '2026-10-05', t: 'L7 · Rumore e filtraggio', sub: 'HE 2.1–2.3, 4.1 · lezione di venerdì 9 ottobre', h: 'teoria/w07-filtri.html' },
    { da: '2026-10-12', t: 'Settimana senza lezione', sub: 'lavoro su assignment ed esercizi', pausa: true },
    { da: '2026-10-19', t: 'L8 · Dati, rumore e incertezza', sub: 'resit in-class test 1, prima della lezione · dati mancanti, covarianza', h: 'teoria/w08-derivate-bordi.html' },
    { da: '2026-10-26', t: 'L9 · Classificazione', sub: 'SH cap. 5, 6–6.3 · DW cap. 14 · HOG, regressione logistica', h: 'teoria/w10-classificatore-lineare.html' },
    { da: '2026-11-02', t: 'L10 · Evaluation (classificazione avanzata)', sub: 'matrici di confusione, metriche, dati sbilanciati', h: 'teoria/w11-metriche.html' },
    { da: '2026-11-09', t: 'L11 · Variabilita e PCA (encoding)', sub: 'parte Assignment 2 — PCA for shape generation', h: 'teoria/w12-pca.html' },
    { da: '2026-11-16', t: 'L12 · PCA II (decoding) e clustering', sub: 'DW cap. 13 e 23 · SH cap. 7 · curse of dimensionality', h: 'teoria/w13-clustering.html' },
    { da: '2026-11-23', t: 'L13 · Modelli non lineari e reti neurali', sub: 'SH 4.4–4.5, 9.1–9.2 · PR cap. 6', h: 'teoria/w14-reti-neurali.html' },
    { da: '2026-11-30', t: 'L14 · Learning e reti neurali', sub: 'backpropagation · video d\'esame e Q&A', h: 'teoria/w14-reti-neurali.html' },
    { da: '2027-01-11', giorni: 9, t: 'Esami orali', sub: 'dall\'11 al 19 gennaio 2027, 30 minuti a testa', h: 'esame/formato.html', esame: true, etichetta: '11–19 gen' }
  ],
  orario: [
    {"giorno": "Mercoledì", "quando": "Esercizi 10:00–12:00", "nota": "Aule 2A20 · 2A54 · 4A20. Qui si tengono presentazioni e ruoli da opponent."},
    {"giorno": "Venerdì", "quando": "Lezione 12:00–16:00 Aud 1", "nota": "I primi 20–45 min sono review: lì cadono anche gli in-class test."}
  ],
  task: [
    {"data": "2026-08-28", "t": "Accesso al repo IML + installazione", "nota": "Clona github.itu.dk/IML/IML2026.git; se non hai accesso, richiedilo via email a Witzner. Ufficialmente supportati solo Windows e macOS.", "tipo": "azione"},
    {"data": "2026-09-04", "t": "Gruppo IML + presentazione e ruoli da opponent", "nota": "Servono almeno 1 presentazione con tutto il gruppo presente e 2 ruoli da opponent. Le settimane si concordano in aula il mercoledì.", "tipo": "azione"},
    {"data": "2026-10-02", "ora": "12:00", "t": "In-class test 1 (individuale)", "nota": "Nei primi 30–45 minuti della lezione 6 (settimana 40, venerdì), carta e penna. Due tentativi in tutto: chi non passa nemmeno il resit non è ammesso all'esame.", "tipo": "test", "provvisoria": true},
    {"data": "2026-09-28", "t": "Assignment 1 — Gaze estimation: iniziare", "nota": "Corre in parallelo agli esercizi della settimana: conviene partire il lunedì. Serve anche il tuo dataset personale raccolto nelle settimane precedenti.", "tipo": "tappa"},
    {"data": "2026-10-23", "ora": "12:00", "t": "Resit in-class test 1", "nota": "Prima della lezione 8 (settimana 43, venerdì). Secondo e ultimo tentativo.", "tipo": "test", "provvisoria": true},
    {"data": "2026-10-16", "t": "Assignment 1 — consegna", "nota": "Deadline esatta su LearnIT (attività «Assignment 1»). Notebook + cartella sessions con i soli .csv. Esiste anche l'attività di ri-consegna: una settimana in più se serve.", "tipo": "consegna", "provvisoria": true},
    {"data": "2026-11-09", "t": "Assignment 2 — PCA: parte 1", "nota": "La parte 1 è affrontabile dopo la lezione 11. Dipende molto dall'implementazione PCA fatta negli esercizi in aula.", "tipo": "tappa"},
    {"data": "2026-11-16", "t": "Assignment 2 — PCA: parte 2", "nota": "Seconda parte dopo la lezione 12 (generazione di forme, spazi latenti).", "tipo": "tappa"},
    {"data": "2026-11-27", "t": "Assignment 2 — consegna", "nota": "Deadline esatta su LearnIT. Notebook con implementazione e note.", "tipo": "consegna", "provvisoria": true}
  ],
  daConfermare: [
    "Le scadenze esatte dei due assignment: la pagina LearnIT e il sito del corso rimandano a LearnIT senza date.",
    "Le date dei due in-class test: il sito del corso indica il test nella lezione 6 (settimana 40) e il resit prima della lezione 8 (settimana 43). Un vecchio calendario riportava le settimane 39 e 41.",
    "Quanti sono gli esercizi obbligatori settimanali delle prime 5–6 settimane: la descrizione ufficiale li cita, il sito del corso elenca solo i due assignment.",
    "Orari e aule (esercizi il mercoledì 10–12, lezione il venerdì 12–16 in Aud 1): vengono dal vecchio calendario, non dai documenti LearnIT."
  ],

  traduzioni: {
    "en": {
      "Home del corso": "Course home",
      "Teoria": "Theory",
      "Esame": "Exam",
      "In arrivo": "Coming up",
      "basi": "basics",
      "pratica": "practice",
      "Parti da zero": "Start from zero",
      "Nozioni utili": "Useful notions",
      "Dimensioni nei prodotti tra matrici": "Dimensions in matrix products",
      "Python per gli esercizi": "Python for the exercises",
      "NumPy: forme, assi, errori": "NumPy: shapes, axes, errors",
      "Derivate: le regole": "Derivatives: the rules",
      "Esercizi a mano: in-class test": "Hand exercises: in-class test",
      "Formulario": "Formulary",
      "S1 · Introduzione, dati e vettori": "S1 · Introduction, data and vectors",
      "Cos’è il machine learning": "What machine learning is",
      "Il modello lineare 1D": "The 1D linear model",
      "Loss dei minimi quadrati": "The least-squares loss",
      "Equazioni del modello: isolare w": "Model equations: isolating w",
      "Funzioni e composizione": "Functions and composition",
      "Indicizzare array NumPy": "Indexing NumPy arrays",
      "S2 · Rappresentazioni vettoriali": "S2 · Vector representations",
      "Dati come vettori": "Data as vectors",
      "Lunghezza e distanza": "Length and distance",
      "Prodotto interno": "Inner product",
      "Rette, piani e iperpiani": "Lines, planes and hyperplanes",
      "S3 · Algebra lineare": "S3 · Linear algebra",
      "Matrici e prodotto": "Matrices and product",
      "Sistemi lineari, inversa, determinante": "Linear systems, inverse, determinant",
      "S4 · Trasformazioni lineari": "S4 · Linear transformations",
      "Trasformazioni lineari in 2D": "Linear transformations in 2D",
      "Polinomi: modelli lineari nei parametri": "Polynomials: models linear in the parameters",
      "S5 · Modelli e minimi quadrati": "S5 · Models and least squares",
      "Minimi quadrati e proiezioni": "Least squares and projections",
      "Affine e coordinate omogenee": "Affine and homogeneous coordinates",
      "Kernel e trasformazioni delle feature": "Kernels and feature transformations",
      "Covarianza, correlazione, causalità, effect size": "Covariance, correlation, causality, effect size",
      "S6 · Rumore, basi, Assignment 1": "S6 · Noise, bases, Assignment 1",
      "Rumore, dati e generalizzazione": "Noise, data and generalisation",
      "Spazi vettoriali, indipendenza e basi": "Vector spaces, independence and bases",
      "Assignment 1: stimare lo sguardo": "Assignment 1: estimating gaze",
      "S7 · Complessità, validazione, filtri": "S7 · Complexity, validation, filters",
      "Complessità del modello": "Model complexity",
      "Validazione e regolarizzazione": "Validation and regularisation",
      "Filtri: media, correlazione, convoluzione": "Filters: mean, correlation, convolution",
      "S8 · Derivate, gradienti, sguardo": "S8 · Derivatives, gradients, gaze",
      "Derivate, gradienti e bordi": "Derivatives, gradients and edges",
      "Filtrare il segnale dello sguardo": "Filtering the gaze signal",
      "S9 · Capire i dati": "S9 · Understanding data",
      "Covarianza e correlazione": "Covariance and correlation",
      "Statistica descrittiva per valutare i modelli": "Descriptive statistics to evaluate models",
      "Dati mancanti, outlier e normale multivariata": "Missing data, outliers and the multivariate normal",
      "S10 · Classificazione": "S10 · Classification",
      "Classificatore lineare e regressione logistica": "Linear classifier and logistic regression",
      "k-nearest neighbour: l'esercizio": "k-nearest neighbour: the exercise",
      "Confini non lineari, SVM e alberi": "Non-linear boundaries, SVM and trees",
      "S11 · Valutazione e HOG": "S11 · Evaluation and HOG",
      "Metriche di valutazione": "Evaluation metrics",
      "HOG: istogrammi di gradienti": "HOG: histograms of gradients",
      "S12 · PCA": "S12 · PCA",
      "Autovalori e PCA": "Eigenvalues and PCA",
      "S13 · Clustering": "S13 · Clustering",
      "K-means, mean shift, agglomerativo": "K-means, mean shift, agglomerative",
      "S14 · Reti neurali": "S14 · Neural networks",
      "Discesa del gradiente e backpropagation": "Gradient descent and backpropagation",
      "Com'è l'esame orale": "What the oral exam is like",
      "Le 12 domande": "The 12 questions",
      "Attività obbligatorie": "Mandatory activities",
      "orale di 30 minuti: primo giorno della finestra 11–19 gennaio (il tuo turno esce prima di Natale)": "30-minute oral: first day of the 11–19 January window (your slot comes out before Christmas)"
    },
    "da": {
      "Home del corso": "Kursets forside",
      "Teoria": "Teori",
      "Esame": "Eksamen",
      "In arrivo": "Kommer",
      "basi": "grundlag",
      "pratica": "praksis",
      "Parti da zero": "Start fra bunden",
      "Nozioni utili": "Nyttige begreber",
      "Dimensioni nei prodotti tra matrici": "Dimensioner i matrixprodukter",
      "Python per gli esercizi": "Python til øvelserne",
      "NumPy: forme, assi, errori": "NumPy: former, akser, fejl",
      "Derivate: le regole": "Afledede: reglerne",
      "Esercizi a mano: in-class test": "Øvelser i hånden: test i klassen",
      "Formulario": "Formularium",
      "S1 · Introduzione, dati e vettori": "S1 · Introduktion, data og vektorer",
      "Cos’è il machine learning": "Hvad machine learning er",
      "Il modello lineare 1D": "Den lineære 1D-model",
      "Loss dei minimi quadrati": "Mindste kvadraters tab",
      "Equazioni del modello: isolare w": "Modelligninger: isolér w",
      "Funzioni e composizione": "Funktioner og sammensætning",
      "Indicizzare array NumPy": "Indeksering af NumPy-arrays",
      "S2 · Rappresentazioni vettoriali": "S2 · Vektorrepræsentationer",
      "Dati come vettori": "Data som vektorer",
      "Lunghezza e distanza": "Længde og afstand",
      "Prodotto interno": "Indre produkt",
      "Rette, piani e iperpiani": "Linjer, planer og hyperplaner",
      "S3 · Algebra lineare": "S3 · Lineær algebra",
      "Matrici e prodotto": "Matricer og produkt",
      "Sistemi lineari, inversa, determinante": "Lineære systemer, invers, determinant",
      "S4 · Trasformazioni lineari": "S4 · Lineære transformationer",
      "Trasformazioni lineari in 2D": "Lineære transformationer i 2D",
      "Polinomi: modelli lineari nei parametri": "Polynomier: modeller lineære i parametrene",
      "S5 · Modelli e minimi quadrati": "S5 · Modeller og mindste kvadrater",
      "Minimi quadrati e proiezioni": "Mindste kvadrater og projektioner",
      "Affine e coordinate omogenee": "Affine og homogene koordinater",
      "Kernel e trasformazioni delle feature": "Kerner og feature-transformationer",
      "Covarianza, correlazione, causalità, effect size": "Kovarians, korrelation, kausalitet, effektstørrelse",
      "S6 · Rumore, basi, Assignment 1": "S6 · Støj, baser, Assignment 1",
      "Rumore, dati e generalizzazione": "Støj, data og generalisering",
      "Spazi vettoriali, indipendenza e basi": "Vektorrum, uafhængighed og baser",
      "Assignment 1: stimare lo sguardo": "Assignment 1: estimering af blikket",
      "S7 · Complessità, validazione, filtri": "S7 · Kompleksitet, validering, filtre",
      "Complessità del modello": "Modelkompleksitet",
      "Validazione e regolarizzazione": "Validering og regularisering",
      "Filtri: media, correlazione, convoluzione": "Filtre: middelværdi, korrelation, konvolution",
      "S8 · Derivate, gradienti, sguardo": "S8 · Afledede, gradienter, blik",
      "Derivate, gradienti e bordi": "Afledede, gradienter og kanter",
      "Filtrare il segnale dello sguardo": "Filtrering af blik-signalet",
      "S9 · Capire i dati": "S9 · Forstå data",
      "Covarianza e correlazione": "Kovarians og korrelation",
      "Statistica descrittiva per valutare i modelli": "Deskriptiv statistik til at vurdere modeller",
      "Dati mancanti, outlier e normale multivariata": "Manglende data, outliers og den multivariate normalfordeling",
      "S10 · Classificazione": "S10 · Klassifikation",
      "Classificatore lineare e regressione logistica": "Lineær klassifikator og logistisk regression",
      "k-nearest neighbour: l'esercizio": "k-nearest neighbour: øvelsen",
      "Confini non lineari, SVM e alberi": "Ikke-lineære grænser, SVM og træer",
      "S11 · Valutazione e HOG": "S11 · Evaluering og HOG",
      "Metriche di valutazione": "Evalueringsmetrikker",
      "HOG: istogrammi di gradienti": "HOG: histogrammer af gradienter",
      "S12 · PCA": "S12 · PCA",
      "Autovalori e PCA": "Egenværdier og PCA",
      "S13 · Clustering": "S13 · Clustering",
      "K-means, mean shift, agglomerativo": "K-means, mean shift, agglomerativ",
      "S14 · Reti neurali": "S14 · Neurale netværk",
      "Discesa del gradiente e backpropagation": "Gradientnedstigning og backpropagation",
      "Com'è l'esame orale": "Sådan er den mundtlige eksamen",
      "Le 12 domande": "De 12 spørgsmål",
      "Attività obbligatorie": "Obligatoriske aktiviteter",
      "orale di 30 minuti: primo giorno della finestra 11–19 gennaio (il tuo turno esce prima di Natale)": "30 minutters mundtlig eksamen: første dag i vinduet 11.–19. januar (dit tidspunkt kommer før jul)"
    }
  },
  tradotte: {"en": ["esame/domande.html", "esame/formato.html", "esame/obbligatori.html", "index.html", "teoria/nozioni-derivate.html", "teoria/nozioni-dimensioni.html", "teoria/nozioni-esercizi-test.html", "teoria/nozioni-formulario.html", "teoria/nozioni-numpy.html", "teoria/nozioni-python.html", "teoria/w01-cos-e-ml.html", "teoria/w01-equazioni-modello.html", "teoria/w01-funzioni.html", "teoria/w01-indicizzazione-numpy.html", "teoria/w01-loss-minimi-quadrati.html", "teoria/w01-modello-lineare.html", "teoria/w02-dati-come-vettori.html", "teoria/w02-iperpiani.html", "teoria/w02-norme-distanze.html", "teoria/w02-prodotto-interno.html", "teoria/w03-matrici.html", "teoria/w03-sistemi-lineari.html", "teoria/w04-polinomi.html", "teoria/w04-trasformazioni.html", "teoria/w05-affine-omogenee.html", "teoria/w05-correlazione-causalita.html", "teoria/w05-kernel.html", "teoria/w05-minimi-quadrati.html", "teoria/w06-assignment1-gaze.html", "teoria/w06-basi.html", "teoria/w06-rumore-generalizzazione.html", "teoria/w07-complessita-modello.html", "teoria/w07-filtri.html", "teoria/w07-validazione.html", "teoria/w08-derivate-bordi.html", "teoria/w08-sguardo-filtrato.html", "teoria/w09-covarianza-correlazione.html", "teoria/w09-dati-mancanti-outlier.html", "teoria/w09-statistica-descrittiva.html", "teoria/w10-classificatore-lineare.html", "teoria/w10-confini-non-lineari.html", "teoria/w10-knn.html", "teoria/w11-hog.html", "teoria/w11-metriche.html", "teoria/w12-pca.html", "teoria/w13-clustering.html", "teoria/w14-reti-neurali.html"], "da": ["esame/domande.html", "esame/formato.html", "esame/obbligatori.html", "index.html", "teoria/nozioni-derivate.html", "teoria/nozioni-dimensioni.html", "teoria/nozioni-esercizi-test.html", "teoria/nozioni-formulario.html", "teoria/nozioni-numpy.html", "teoria/nozioni-python.html", "teoria/w01-cos-e-ml.html", "teoria/w01-equazioni-modello.html", "teoria/w01-funzioni.html", "teoria/w01-indicizzazione-numpy.html", "teoria/w01-loss-minimi-quadrati.html", "teoria/w01-modello-lineare.html", "teoria/w02-dati-come-vettori.html", "teoria/w02-iperpiani.html", "teoria/w02-norme-distanze.html", "teoria/w02-prodotto-interno.html", "teoria/w03-matrici.html", "teoria/w03-sistemi-lineari.html", "teoria/w04-polinomi.html", "teoria/w04-trasformazioni.html", "teoria/w05-affine-omogenee.html", "teoria/w05-correlazione-causalita.html", "teoria/w05-kernel.html", "teoria/w05-minimi-quadrati.html", "teoria/w06-assignment1-gaze.html", "teoria/w06-basi.html", "teoria/w06-rumore-generalizzazione.html", "teoria/w07-complessita-modello.html", "teoria/w07-filtri.html", "teoria/w07-validazione.html", "teoria/w08-derivate-bordi.html", "teoria/w08-sguardo-filtrato.html", "teoria/w09-covarianza-correlazione.html", "teoria/w09-dati-mancanti-outlier.html", "teoria/w09-statistica-descrittiva.html", "teoria/w10-classificatore-lineare.html", "teoria/w10-confini-non-lineari.html", "teoria/w10-knn.html", "teoria/w11-hog.html", "teoria/w11-metriche.html", "teoria/w12-pca.html", "teoria/w13-clustering.html", "teoria/w14-reti-neurali.html"]},
  menu: [
    { t: 'Home del corso', h: 'index.html', noCapito: true },

    { sez: 'Teoria' },
    { g: 'Nozioni utili', quando: 'pratica', figli: [
      { t: 'Dimensioni nei prodotti tra matrici', h: 'teoria/nozioni-dimensioni.html' },
      { t: 'Python per gli esercizi', h: 'teoria/nozioni-python.html' },
      { t: 'NumPy: forme, assi, errori', h: 'teoria/nozioni-numpy.html' },
      { t: 'Derivate: le regole', h: 'teoria/nozioni-derivate.html' },
      { t: 'Esercizi a mano: in-class test', h: 'teoria/nozioni-esercizi-test.html' },
      { t: 'Formulario', h: 'teoria/nozioni-formulario.html' }
    ] },
    { g: 'S1 · Introduzione, dati e vettori', quando: '24 ago', aperto: true, figli: [
      { t: 'Cos’è il machine learning', h: 'teoria/w01-cos-e-ml.html' },
      { t: 'Il modello lineare 1D', h: 'teoria/w01-modello-lineare.html' },
      { t: 'Loss dei minimi quadrati', h: 'teoria/w01-loss-minimi-quadrati.html' },
      { t: 'Equazioni del modello: isolare w', h: 'teoria/w01-equazioni-modello.html' },
      { t: 'Funzioni e composizione', h: 'teoria/w01-funzioni.html' },
      { t: 'Indicizzare array NumPy', h: 'teoria/w01-indicizzazione-numpy.html' }
    ] },
    { g: 'S2 · Rappresentazioni vettoriali', quando: '31 ago', figli: [
      { t: 'Dati come vettori', h: 'teoria/w02-dati-come-vettori.html' },
      { t: 'Lunghezza e distanza', h: 'teoria/w02-norme-distanze.html' },
      { t: 'Prodotto interno', h: 'teoria/w02-prodotto-interno.html' },
      { t: 'Rette, piani e iperpiani', h: 'teoria/w02-iperpiani.html' },
    ] },
    { g: 'S3 · Algebra lineare', quando: '7 set', figli: [
      { t: 'Matrici e prodotto', h: 'teoria/w03-matrici.html' },
      { t: 'Sistemi lineari, inversa, determinante', h: 'teoria/w03-sistemi-lineari.html' }
    ] },
    { g: 'S4 · Trasformazioni lineari', quando: '14 set', figli: [
      { t: 'Trasformazioni lineari in 2D', h: 'teoria/w04-trasformazioni.html' },
      { t: 'Polinomi: modelli lineari nei parametri', h: 'teoria/w04-polinomi.html' }
    ] },
    { g: 'S5 · Modelli e minimi quadrati', quando: '21 set', figli: [
      { t: 'Minimi quadrati e proiezioni', h: 'teoria/w05-minimi-quadrati.html' },
      { t: 'Affine e coordinate omogenee', h: 'teoria/w05-affine-omogenee.html' },
      { t: 'Kernel e trasformazioni delle feature', h: 'teoria/w05-kernel.html' },
      { t: 'Covarianza, correlazione, causalità, effect size', h: 'teoria/w05-correlazione-causalita.html' },
    ] },
    { g: 'S6 · Rumore, basi, Assignment 1', quando: '28 set', figli: [
      { t: 'Rumore, dati e generalizzazione', h: 'teoria/w06-rumore-generalizzazione.html' },
      { t: 'Spazi vettoriali, indipendenza e basi', h: 'teoria/w06-basi.html' },
      { t: 'Assignment 1: stimare lo sguardo', h: 'teoria/w06-assignment1-gaze.html', noCapito: true }
    ] },
    { g: 'S7 · Complessità, validazione, filtri', quando: '5 ott', figli: [
      { t: 'Complessità del modello', h: 'teoria/w07-complessita-modello.html' },
      { t: 'Validazione e regolarizzazione', h: 'teoria/w07-validazione.html' },
      { t: 'Filtri: media, correlazione, convoluzione', h: 'teoria/w07-filtri.html' }
    ] },
    { g: 'S8 · Derivate, gradienti, sguardo', quando: '19 ott', figli: [
      { t: 'Derivate, gradienti e bordi', h: 'teoria/w08-derivate-bordi.html' },
      { t: 'Filtrare il segnale dello sguardo', h: 'teoria/w08-sguardo-filtrato.html' }
    ] },
    { g: 'S9 · Capire i dati', quando: '26 ott', figli: [
      { t: 'Covarianza e correlazione', h: 'teoria/w09-covarianza-correlazione.html' },
      { t: 'Statistica descrittiva per valutare i modelli', h: 'teoria/w09-statistica-descrittiva.html' },
      { t: 'Dati mancanti, outlier e normale multivariata', h: 'teoria/w09-dati-mancanti-outlier.html' }
    ] },
    { g: 'S10 · Classificazione', quando: '2 nov', figli: [
      { t: 'Classificatore lineare e regressione logistica', h: 'teoria/w10-classificatore-lineare.html' },
      { t: 'k-nearest neighbour: l\'esercizio', h: 'teoria/w10-knn.html' },
      { t: 'Confini non lineari, SVM e alberi', h: 'teoria/w10-confini-non-lineari.html' }
    ] },
    { g: 'S11 · Valutazione e HOG', quando: '9 nov', figli: [
      { t: 'Metriche di valutazione', h: 'teoria/w11-metriche.html' },
      { t: 'HOG: istogrammi di gradienti', h: 'teoria/w11-hog.html' }
    ] },
    { g: 'S12 · PCA', quando: '16 nov', figli: [
      { t: 'Autovalori e PCA', h: 'teoria/w12-pca.html' }
    ] },
    { g: 'S13 · Clustering', quando: '23 nov', figli: [
      { t: 'K-means, mean shift, agglomerativo', h: 'teoria/w13-clustering.html' }
    ] },
    { g: 'S14 · Reti neurali', quando: '30 nov', figli: [
      { t: 'Discesa del gradiente e backpropagation', h: 'teoria/w14-reti-neurali.html' }
    ] },

    { sez: 'Esame' },
    { t: 'Com\'è l\'esame orale', h: 'esame/formato.html', noCapito: true },
    { t: 'Le 12 domande', h: 'esame/domande.html' },
    { t: 'Attività obbligatorie', h: 'esame/obbligatori.html', noCapito: true }
  ]
};
