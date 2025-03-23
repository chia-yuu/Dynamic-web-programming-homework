-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-12-19 23:41:27
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `final_proj`
--

-- --------------------------------------------------------

--
-- 資料表結構 `medieval`
--

CREATE TABLE `medieval` (
  `image` mediumtext NOT NULL,
  `title` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `description` text NOT NULL,
  `author` mediumtext NOT NULL,
  `date` mediumtext NOT NULL,
  `materials` mediumtext NOT NULL,
  `technique` mediumtext NOT NULL,
  `dimensions` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `medieval`
--

INSERT INTO `medieval` (`image`, `title`, `type`, `description`, `author`, `date`, `materials`, `technique`, `dimensions`, `category`, `ID`) VALUES
('https://sammlung.staedelmuseum.de/images/1777/meister-des-nuernberger-marienaltars-agony-garden-1792--thumb-lg.jpg', 'The Agony in the Garden', 'drawing', 'The brothers Jacob H. and Philipp Schiff were members of one of the old Jewish families in Frankfurt. Jacob H. Schiff was eighteen when he emigrated to America, where he became a very successful banker. He contributed most of his considerable fortune - some 100 million dollars - to humanitarian causes. He also made a number of generous donations to his home town of Frankfurt, including to the university and the Senckenberg Nature Research Society. Like his brother, Philipp, Jacob was also a member of the St?delscher Museums-Verein.', 'Nuremberg Master of the Altarpiece of the Virgin', '1420 - 1430', 'paper', 'drawn', '98.1 x 120.2 cm', 4, 1),
('https://sammlung.staedelmuseum.de/images/881/meister-von-flemalle-robert-campin-werkstatt-bad-thief-left-886--thumb-lg.jpg', 'The Bad Thief to the Left of Christ; former exterior wing of the triptych: Saint John the Baptist', 'drawing', 'This imposing, cruelly exact image depicts the corpse of one of the two criminals crucified with Jesus. Executed in the workshop of Robert Campin in Tournai around 1430 -- at about the same time as the Van Eyck brothers\' Ghent Altarpiece ?V it is all that remains of one of the most important retables of fifteenth-century Netherlands. The central section of the triptych, of which many copies survive, showed the Deposition. The Stadel panel formed the upper half of the inside of the right-hand wing; the outer side showed John the Baptist as a simulated sculpture.', 'Master of Flemalle, Robert Campin', '1430', 'paper', 'drawn', '134.2 x 92.5 cm', 4, 2),
('https://sammlung.staedelmuseum.de/images/2119/bartolomeo-bulgarini-blinding-st-victor-2135--thumb-lg.jpg', 'The Blinding of St Victor', 'drawing', 'Its richness of execution and its artistic quality are what make this panel so captivating. It was once part of the predella of an altarpiece ?V later largely destroyed ?V from Siena Cathedral. Bulgarini\'s retable and three others by Pietro and Ambrogio Lorenzetti and Simone Martini surrounded the city\'s principal religious work, \"Duccio\'s Maesta\". For his depiction of the blinding of St Victor, the artist used the kiss of Judas as his formal model. Victor\'s martyrdom is thus linked in a prestige-enhancing manner with the Passion of Christ.', 'Bartolomeo Bulgarini', '1351', 'paper', 'drawn', '41 x 39.6 cm', 4, 3),
('https://sammlung.staedelmuseum.de/images/3294/nuernberger-meister-um-135060-coronation-virgin-sg443--thumb-lg.jpg', 'The Coronation of the Virgin, reverse: Christ Carrying the Cross', 'drawing', 'This panel fragment presumably came from a convent of the Poor Clares in Nuremberg. It is typical testimony to late fourteenth-century female mysticism. The front features \'The Coronation of the Virgin\'. The banderoles quote the \'Song of Solomon\' and characterise Mary as Christ\'s bride, a symbol of the church and a loving soul -- a quality with which particularly women could identify. The back shows the extant upper section of a cross-bearing Christ as a kind of instruction in vicarious suffering. The panel was part of a tabernacle altarpiece whose wings flanked a central sculpture.', 'Nuremberg Master', '1350 - 1360', 'paper', 'drawn', '35.2 x 25.1  cm', 4, 4),
('https://sammlung.staedelmuseum.de/images/2693/mittelrheinischer-meister-um-1420-crucifixion-1-hm1--thumb-lg.jpg', 'The Crucifixion', 'drawing', 'The main panel of the winged altarpiece features the Crucifixion. At the centre of the crowded scene is the crucifix, clasped by Mary Magdalene, before it a group with the unconscious Virgin and St Veronica. The latter presents the sudarium to the onlookers kneeling in the right foreground. Their pious devotion supplies the retable viewer with \"instructions for use\". Split into two in the nineteenth century, the wings are not extant in their entirety. The inner sides show further scenes from the Passion; of the paintings on the outer sides, only the Visitation has survived.', 'Master of the Middle Rhine', '1420', 'paper', 'drawn', '186.4 x 168.4 cm', 4, 5),
('https://sammlung.staedelmuseum.de/images/101751/pietro-lorenzetti-werkstatt-crucifixion-virgin-and-child-995a-c--thumb-lg.jpg', 'Crucifixion, Virgin and Child, Deacon and Scenes from the Legends of Saints Matthew and John the Evangelist', 'drawing', 'Attributed to Pietro Lorenzetti and his workshop, this polyptych is like a miniature version of a large altarpiece. In the centre are depictions of the Crucifixion and the enthroned Virgin and Child with a kneeling deacon. The left-hand side recounts the calling and martyrdom of St Matthew, while the sections on the right show St John on the island of Patmos and his ascension to heaven. Parts of the latter scene reveal the influence of Giotto\'s fresco in Santa Croce in Florence. This wittily devised pictorial narrative is crowned by a row of saints and the Annunciation.', 'Pietro Lorenzetti', '1345 - 1350', 'paper', 'drawn', '98.5 x 71.4 cm', 4, 6),
('https://sammlung.staedelmuseum.de/images/102202/meister-von-flemalle-robert-campin-werkstatt-flemalle-panels-939+939a+939b--thumb-lg.jpg', 'The Flemalle Panels: St. Veronica with the Veil, Madonna Breastfeeding, The Trinity', 'drawing', 'These panels are among the most important but also most puzzling works of early Netherlandish painting. Parts of a winged altarpiece, they were first attributed to the \'Master of Flemalle\' on account of their supposed place of origin in the Meuse Valley in Belgium. However, obvious differences between the three paintings make it impossible to ascribe them to a single artist. It is now thought certain that they all came from the workshop of Robert Campin in Tournai, where Rogier van der Weyden also worked around 1430. The exact attribution is disputed even today.', 'Master of Flemalle, Robert Campin', '1428 - 1430', 'paper', 'drawn', '160.2 x 68.2 cm', 4, 7),
('https://sammlung.staedelmuseum.de/images/2749/oberrheinischer-meister-um-141020-little-garden-paradise-hm54--thumb-lg.jpg', 'The Little Garden of Paradise', 'drawing', 'In unparalleled manner, the courtly charm of the Late Gothic, so-called Soft Style unites in this work with the realistic observation of nature: twenty-four plant and twelve bird species are precisely identifiable. The artist was evidently also quite knowledgeable about the behaviour of animals. The theme is a gathering in paradise attended by the Virgin and Child and a number of saints. Elements of the sacred \'hortus conclusus\' ( \'closed garden\' ) -- an allusion to Mary\'s virginity ?V are skilfully combined with motifs from secular castle and love gardens.', 'Upper Rhenish Master', '1410 - 1420', 'paper', 'drawn', '25.6 x 32.8 cm', 4, 8),
('https://sammlung.staedelmuseum.de/images/937/jan-van-eyck-lucca-madonna-944--thumb-lg.jpg', 'Lucca Madonna', 'drawing', 'No other work by Jan van Eyck conveys a sense of such immediate intimacy between the viewer and the figures depicted as this painting. This effect is achieved not only by the tender portrayal of the mother-child relationship, but also by the masterly employment of light and shade, and above all the apparently casual -- but in fact highly sophisticated -- treatment of space. The floor, side walls and vaulted ceiling appear to extend seamlessly into the viewer\'s space, an impression further reinforced by the reflection of the window in the glass carafe on the right.', 'Jan van Eyck', '1437', 'paper', 'drawn', '65.7 x 49.6 cm', 4, 9),
('https://sammlung.staedelmuseum.de/images/804/barnaba-da-modena-madonna-and-child-1-807--thumb-lg.jpg', 'Madonna and Child', 'drawing', 'Signed and dated 1367, this panel is one of the earliest works by its maker, an artist active in Genoa. It initially formed the central panel of a multipartite altarpiece whose remaining sections have been lost. Its original location is unknown. As seen in the green underpainting of the flesh tones and the gilding of the Virgin\'s robe, the artist was still following the Italo-Byzantine icon tradition. At the same time, his rendering of the tender intimacy between mother and child demonstrates his familiarity with the Sienese and Florentine painting of the time.', 'Barnaba da Modena', '1367', 'paper', 'drawn', '117.8 x 86.2 cm', 4, 10),
('https://sammlung.staedelmuseum.de/images/834/fra-angelico-madonna-and-child-enthroned-and-twelve-angels-838--thumb-lg.jpg', 'Madonna and Child Enthroned and Twelve Angels', 'drawing', 'This panel by the Florentine artist-monk was probably created in the 1420s. It shows the Madonna enthroned, surrounded by twelve angels. Executed with fine brushwork and lavish gilding, the work will no doubt have served equally as a picture for individual devotions and as a demonstration of cultivated art connoisseurship. In this small-format masterpiece of the early Renaissance, Fra Angelico pulled out all the stops with regard to his skills. This is evident in particular in the perspectival design of the canopy above the throne and the wide range of poses and gestures of the angels.', 'Fra Angelico', '1420 - 1430', 'paper', 'drawn', '37.5 x 29.7 cm', 4, 11),
('https://sammlung.staedelmuseum.de/images/846/rogier-van-der-weyden-medici-madonna-850--thumb-lg.jpg', 'Medici Madonna', 'drawing', 'Soon after his return from a pilgrimage to Rome in 1450, Rogier van der Weyden was commissioned to paint a devotional picture for the Medici, the Florentine bankers\' family. This is evidenced by the choice of the \'sacra conversazione\' (sacred conversation) -- a pictorial type unusual in the North -- the Florentine escutcheon with the lily, and above all the identities of the saints accompanying the Virgin: the doctor-saints Cosmas and Damian were the Medici\'s patron saints, while Peter and John the Baptist were the baptismal saints of two leading family members, Piero and Giovanni de\' Medici.', 'Rogier van der Weyden', '1453 - 1460', 'paper', 'drawn', '53.1 x 37.5 cm', 4, 12),
('https://sammlung.staedelmuseum.de/images/5897/nuernbergisch-15-jahrhundert-saint-barbara-623z--thumb-lg.jpg', 'Saint Barbara', 'drawing', 'This small ink drawing of St Barbara was most likely produced in Nuremberg during the second decade of the fifteenth century, making it one of the earliest examples of drawing on paper. The S-shaped curve of the delicate figure, the voluminous thin folds and opulently flowing robe, which ends in a pedestal-like base, shows it to be a work of International Gothic, the formulaically stylised and delightful style known in German as \'sch?ner Stil\' (\'beautiful style\') or \'weicher Stil\' (\'soft style\') and which was widely practised throughout Europe around 1400. St Barbara is one of the \'Fourteen Auxiliary Helpers\' - saints who could be invoked in all emergencies - and was thus particularly revered. The illustrator, who had a noticeable preference for artistically undulating, calligraphic lines, has outlined the figure of the saint with a firm contour and developed the folds of the robe three-dimensionally with parallel pen strokes. The figure nonetheless remains mostly two-dimensional; her body appears to be neither a volume nor a well-balanced organism; and she really ought to be carrying the weighty tower, the attribute that identifies her as St Barbara and which looks exchangeable, on her other hip, which she has thrust forward. Inconsistencies like the martyr\'s palm \"floating\" behind her left hand and the almost silhouette-like isolation of the figure indicate that this fluently drawn work was created as a copy - possibly from a painting. One of the most important early functions of drawings was to \"transport\" forms and preserve them in the stock of reference pictures stored in a late-medieval artist\'s workshop.', 'Nuremberg dialect', '1410 - 1420', 'paper', 'drawn', '84 x 90 cm', 4, 13),
('https://sammlung.staedelmuseum.de/images/101750/martino-di-bartolomeo-seven-scenes-legend-st-stephen-988-994--thumb-lg.jpg', 'Seven Scenes from the Legend of St. Stephen', 'drawing', 'Altarpieces dedicated to a single saint generally stood on side altars. In fourteenth- and early fifteenth-century Italy they often adhered to the so-called vita retable type, in which scenes from the life of the saint formed a U-shaped garland around a depiction of that saint at the centre. Originally, Martino di Bartolomeo\'s vita retable of St Stephen was probably installed in the church of Sant\' Agostino in Siena. Only its narrative pictures have survived; the literally central image of the saint has been lost.', 'Martino di Bartolomeo', '1390', 'paper', 'drawn', '281 x 205.2 cm', 4, 14),
('https://sammlung.staedelmuseum.de/images/1871/deodato-orlandi-st-john-evangelist-mourning-1887--thumb-lg.jpg', 'St John the Evangelist Mourning', 'drawing', 'This depiction, which looks like a painting in its own right, is only a fragment of a panel cross. The laterally widened stem showed the crucified Christ, while vertical rectangular picture fields at the ends of the crosspiece featured half-length figures of the Virgin and St John. Painted crosses of this kind hung above the rood screen or at the entrance to the choir in large churches. Deodato Orlandi may have painted this one (which, at originally about 5.30 metres, was unusually tall) for San Piero a Grado, near Pisa, for which he also executed an extensive cycle of frescos.', 'Deodato Orlandi', '1300 - 1310', 'paper', 'drawn', '54.3 x 43.1 cm', 4, 15),
('https://sammlung.staedelmuseum.de/images/1037/andrea-mantegna-st-mark-evangelist-1046--thumb-lg.jpg', 'St Mark the Evangelist', 'drawing', 'The depiction of St Mark is one of the earliest works by this great Renaissance artist. Unusually, it was painted on canvas. Executed around 1450, it is a fine example of how Mantegna combined his knowledge of classical architectural motifs and perspective with his skill in reproducing the most varied materials and reflecting surfaces. He had learned the latter by studying early Netherlandish oil paintings. He thus far exceeded anything his fellow Italian artists were able to achieve with traditional egg-tempera-based paint.', 'Andrea Mantegna', '1448 - 1451', 'paper', 'drawn', '82 x 64.3 cm', 4, 16),
('https://sammlung.staedelmuseum.de/images/102049/stefan-lochner-two-altarpiece-wings-martyrdom-apostles-821-832--thumb-lg.jpg', 'Two altarpiece wings with the Martyrdom of the Apostles', 'drawing', 'Stefan Lochner is fifteenth-century Cologne\'s most important painter. These two altarpiece wings were once in the city\'s Church of St Lawrence. What were originally their outer sides are now in the Alte Pinakothek in Munich. They probably once formed a retable with the \'Last Judgement\' at the Cologne Wallraf-Richartz-Museum. The Frankfurt panels testify as much to Lochner\'s ingenious staging as to his obsession with realistic detail. In the case of the martyrdoms, he does not shy away even from the depiction of shocking cruelty -- one need only consider, for example, the flaying of Bartholomew.', 'Stefan Lochner', '1435', 'paper', 'drawn', '121 x 163.1 cm', 4, 17),
('https://sammlung.staedelmuseum.de/images/1158/burnham-meister-virgin-and-child-enthroned-angels-making-mus-1168--thumb-lg.jpg', 'Virgin and Child Enthroned with Angels Making Music', 'drawing', 'The donor of this picture is thought to have been the Frankfurt businessman Ludwig Adolf von L?wenstein (1845?V1911). L?wenstein was a partner in the firm of Gebr?der L?wenstein, which from 1861 onwards had a shop in Kaiserstrasse selling jewellery, pearls and antiques. Besides his business activities, L?wenstein was imperial consul-general of Persia. Sometime between 1891 and 1896 he was ennobled, receiving the title of baron. From then on the Frankfurt directory no longer listed him as a businessman ?V such a designation would not have been fitting for a baron.', 'Burnham Master', '1430', 'paper', 'drawn', '174.2 x 124.4 cm', 4, 18),
('https://sammlung.staedelmuseum.de/images/914/petrus-christus-virgin-and-child-saints-jerome-and-francis-920--thumb-lg.jpg', 'Virgin and Child with Saints Jerome and Francis', 'drawing', 'Johann David Passavant (1787-1861) trained as a merchant in Frankfurt, but he then worked as a painter and art expert. In 1839 he published his book on Raphael from Urbino and his father, Giovanni Santi, which the author dedicated to the \"highly esteemed administration\" of the St?del. In 1840 Passavant was appointed to the position of gallery inspector at the St?del. He bequeathed this painting to the museum during his lifetime, and further works by old masters followed with his bequest of 1861.', 'Petrus Christus', '1457', 'paper', 'drawn', '46.7 x 44.6 cm', 4, 19),
('https://sammlung.staedelmuseum.de/images/102048/rheinischer-meister-um-1330-wings-altenberg-altarpiece-sg358-361--thumb-lg.jpg', 'The Wings of the Altenberg Altarpiece', 'drawing', 'The wings of the retable from Altenberg, near Wetzlar, flanked a section featuring at its centre a sculpture of the Madonna, the convent\'s main patron saint. It is to her that the Three Wise Men on the left wing are kneeling in adoration. The scenes from the life of the Virgin are joined by depictions of the archangel Michael and St Elizabeth of Thuringia, whose daughter Gertrude was the abbess at Altenberg for many years. The elegant two-dimensionality of the robed figures with their slender limbs is typical of the early fourteenth-century High Gothic style.', 'Rhenish Master', '1330', 'paper', 'drawn', '153.7 x 243.8 cm', 4, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `modern`
--

CREATE TABLE `modern` (
  `image` mediumtext NOT NULL,
  `title` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `description` text NOT NULL,
  `author` mediumtext NOT NULL,
  `date` mediumtext NOT NULL,
  `materials` mediumtext NOT NULL,
  `technique` mediumtext NOT NULL,
  `dimensions` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `modern`
--

INSERT INTO `modern` (`image`, `title`, `type`, `description`, `author`, `date`, `materials`, `technique`, `dimensions`, `category`, `ID`) VALUES
('https://sammlung.staedelmuseum.de/images/1839/alexej-von-jawlensky-abstract-head-symphony-pink-1855--thumb-lg.jpg', 'Abstract Head: Symphony in Pink', 'drawing', 'Dot, dot, comma, dash... Although the painting is reduced to a minimum as regards form, Jawlensky\'s \'Abstract Head: Symphony in Pink\' and other such works are simple only at first sight. The artist, a member of the Blauer Reiter group, associated works of this kind with his search for a universally valid archaic image of the human face. Jawlensky began his series of \'Abstract Heads\' in 1918. They comprise 251 works which alternate between abstraction and figuration. The deeply pious Russian saw himself as continuing in the tradition of Russian and Byzantine art and intentionally referenced icon paintings in his work.', 'Alexej von Jawlensky', '1929', 'paper', 'drawn', '36.6 x 27.7 cm', 3, 1),
('https://sammlung.staedelmuseum.de/images/103855/anton-raederscheidt-adam-and-eve-3-2363--thumb-lg.jpg', 'Adam and Eve', 'drawing', 'It is as an exponent of New Objectivity that the Cologne artist Anton Raderscheidt is known. The works he painted in exile in Paris from 1936 onwards have all but fallen into oblivion, only few of them having survived the war. The composition \"Adam and Eve\" conveys the fear and uncertainty that characterised the artist\'s situation. Not only the content, but also the thick application of the paint and extremely free brushwork are reactions to the political circumstances and the penchant for sentimentality that characterized tastes in art during the Third Reich.', 'Anton Raderscheidt', '1936', 'paper', 'drawn', '146 x 113.6 cm', 3, 2),
('https://sammlung.staedelmuseum.de/images/4102/piero-manzoni-achrome-sg1242--thumb-lg.jpg', 'Achrome', 'drawing', 'Regardless of what the title of the work claims, \'Achrome\' is not \'colourless\'. It is not the white of modernism\'s \'purist\' current. It stands for direct, immediate materiality. Early modern art\'s square and grid have been deliberately quoted in the raster of the canvas sections. Yet the elegance of modernism is confronted with an unevenly handcrafted material foreign to art. We owe everything we recognise as \'painting\' to the material\'s drying and ageing process. The artist -- in the sense of the work\'s originator --  has all but withdrawn in favour of an artistic concept that celebrates the beauty of happenstance.', 'Piero Manzoni', '1959 - 1960', 'paper', 'drawn', '80 x 100 cm', 3, 3),
('https://sammlung.staedelmuseum.de/images/2004/otto-mueller-adam-and-eve-2020--thumb-lg.jpg', 'Adam and Eve', 'drawing', 'Otto Mueller is known as the romantic among the \'Brücke\' painters. Throughout his life he confined himself to a small repertoire of nudes and portraits in his search for the simple and primordial. Instead of idealism, this showed a great sensibility for the art market. \'Adam and Eve\' is one of many paintings of lovers. However, the depiction of man and nature is not nearly as primordial as one is lead to believe: in the knowledge of her nakedness, Eve is covering her pudenda, and steps out of paradise with Adam as if it were a cathedral.', 'Otto Mueller', '1913 - 1922', 'paper', 'drawn', '121 x 90.5 cm', 3, 4),
('https://sammlung.staedelmuseum.de/images/11791/paul-klee-alea-jacta-16735z--thumb-lg.jpg', 'alea jacta', 'drawing', 'The Die Is Cas\' was created in March of the war year 1940, three years before Paul Klee died. As always, the artist linked his drawing with a poetic title. The Latin \"alea iacta est\" recalls not only Caesar\'s exclamation when he crossed the Rubicon, as recorded by Suetonius, but also the comment of the humanist Ulrich von Hutten - \"I dared to do it.\" - as he looked back on his life, which ended in 1523 in exile on the island of Ufenau, in Lake Zurich. Klee had emigrated to Switzerland in 1933 after being dismissed by the National Socialists from his teaching post at the Dusseldorf Academy. He spent his last creative years, seriously ill, in his studio in Bern. Sensing his approaching death, the artist chose this expressive saying to match the content of his drawing, which reveals its fateful dimension with a seemingly intuitive and yet calculated formal language.', 'Paul Klee', '1940', 'paper', 'drawn', '346 x 216 cm', 3, 5),
('https://sammlung.staedelmuseum.de/images/4104/max-ernst-aquis-submersus-sg1244--thumb-lg.jpg', 'Aquis submersus', 'drawing', 'The world has congealed into a lifeless backdrop. A limbless figure stands in front of a swimming pool; another dives ramrod straight into the water. The night sky appears above the scene like a stage set ?V an impression strengthened by the hard shadows cast by the prop-like buildings, as well as by the presence of the clock where the moon should be. The act of disappearing from this dreariness allegorises what the Surrealist Max Ernst saw as a rejection of the rational world. In his art he was intensely concerned with the unconscious part of the psyche, symbolised by water.', 'Max Ernst', '1919', 'paper', 'drawn', '54 x 43.8 cm', 3, 6),
('https://sammlung.staedelmuseum.de/images/16935/karl-schmidt-rottluff-ascona-16744z--thumb-lg.jpg', 'Ascona', 'drawing', 'The Frankfurt businessman Dr. Kurt Mollgaard and his wife, Marga, began collecting modern art after 1945. From 1964 on they donated parts of their collection to the Stadelscher Museums-Verein. Kurt Mollgaard commented on his actions: \"We are consciously continuing a tradition which has been cultivated to a remarkable extent by those citizens of Frankfurt who were forced to leave their homes after 1933.\" In 1987, after the death of his wife and his son, Mollgaard founded the Kurt and Marga Mollgaard Foundation. Since then it has enabled the purchase of further artworks, primarily for the Collection of Prints and Drawings.', 'Karl Schmidt-Rottluff', '1927', 'paper', 'drawn', '497 x 680 mm', 3, 7),
('https://sammlung.staedelmuseum.de/images/126187/wilhelm-morgner-astrale-komposition-vi-2525--thumb-lg.jpg', 'Astrale Komposition VI', 'drawing', 'In 1912/13, Wilhelm Morgner created 26 oil paintings and numerous works on paper, which he called Astral Compositions. These works are evidence of his rapid transition from figurative-ornamental depictions to the reproduction of internal processes, in which he gave greater autonomy to the primary colours. Morgner carried out this process based on his central theme of the working man in the field. He increasingly blended the figures with the surrounding space in order to visualise the metaphysical \"unification\" of man and nature. Astral Composition VI shows an advanced stage of development in this process, even though a shadowy silhouette can still be identified in the middle ground. Morgner only created non-representational works until 1913, as he did not want to detach himself completely from nature in the long run. Astral Composition VI illustrates the state of suspension between figuration and abstraction, to which a special position in German Expressionism must be conceded.', 'Wilhelm Morgner', '1912', 'paper', 'drawn', '74.5 x 100 cm', 3, 8),
('https://sammlung.staedelmuseum.de/images/3254/henri-rousseau-avenue-saint-cloud-park-sg404--thumb-lg.jpg', 'The Avenue in Saint-Cloud Park', 'drawing', 'At the age of 41, Henri Rousseau quit his job as a customs official to be able to devote himself solely to painting. Self-taught, he developed a style characterised by distortions, incongruous proportions and perspectives. Here, tiny people walk along an avenue with trees lined up uniformly. Every detail, whether in the foreground or background, is, in a certain naive manner, treated with equal importance. Due to the fusion of dream world and reality in his works, Rousseau is considered one of the pioneers of Surrealism.', 'Henri Rousseau', '1908', 'paper', 'drawn', '46.2 x 37.6 cm', 3, 9),
('https://sammlung.staedelmuseum.de/images/4128/max-beckmann-backstage-sg1268--thumb-lg.jpg', 'Backstage', 'drawing', 'The curtain has fallen for good. A look behind the scenes reveals an unreal, stage-like space of great depth. Numerous exits lead into an indeterminate darkness. Crown, sword, spear and rings – familiar quotations from the artist\'s pictorial world -- are in an apparently arbitrary jumble. It is Beckmann\'s last painting, the one he was still working on the day before his death in New York: a metaphor for the stage of life from which the painter has withdrawn. All is quiet, not a soul is to be seen, the candle has gone out, the props have been set down forever.', 'Max Beckmann', '1950', 'paper', 'drawn', '101.5 x 127 cm', 3, 10),
('https://sammlung.staedelmuseum.de/images/2242/corinne-wasmuht-barrier-2260--thumb-lg.jpg', 'Barrier', 'drawing', 'Corinne Wasmuht\'s Barrier is a painterly reproduction of a collage. Like Gerhard Richter with his \'Atlas\', Wasmuht collects photographic source material and sorts it by subject. It is from this stock of images that she produces her glued collages. This painted version shows a spatial situation which rises diagonally towards the back and is structured -- but also blocked off -- by grids and barriers. The images owes its extremely dynamic quality to the multiplicity of overlapping source images and the simultaneous emphasis on their two-dimensionality.', 'Corinne Wasmuht', '2008', 'paper', 'drawn', '214 x 548 cm', 3, 11),
('https://sammlung.staedelmuseum.de/images/3020/maurice-denis-bathers-sg178--thumb-lg.jpg', 'The Bathers', 'drawing', 'The Post-Impressionist painter Maurice Denis has committed to canvas a delicately coloured bathing scene, which nonetheless looks a little stiff and artificial. However, it is not intended to be realistic, but rather to make the artist\'s impression visually comprehensible. With their knotted hair and the white towels they have wrapped themselves in, the women look like goddesses. The interplay of light and shade is reproduced in light pastel hues, so that the graceful figures appear to be lost in reverie. The little girl in the centre of the painting lends the bathing scene a natural innocence.', 'Maurice Denis', '1907', 'paper', 'drawn', '129.5 x 196 cm', 3, 12),
('https://sammlung.staedelmuseum.de/images/4016/franz-von-stuck-adam-and-eve-1-sg1156--thumb-lg.jpg', 'Adam and Eve', 'drawing', 'This Fall of Man does not take place in Paradise. It has grown out of the pitch-black mental states of Franz von Stuck. In a gently arching contrapposto, the bodies of Adam and Eve step out on to the stage in the foreground of the painting. The serpent writhes around Eve\'s leg, gains possession of her groin, clambers up her outstretched arm and finally bites the apple she is holding in her slender fingers. The red-haired woman gazes longingly at Adam from the shadows. His gesture points back at her body. Sin, lust, decadence - the current state in which Munich\'s \"Painter Prince\" finds himself is visualised here symbolically.', 'Franz von Stuck', '1920', 'paper', 'drawn', '98 x 93.7 cm', 3, 13),
('https://sammlung.staedelmuseum.de/images/128578/oskar-schlemmer-bauhaus-stairway-17910z--thumb-lg.jpg', 'Bauhaus Stairway', 'drawing', 'When the Nazi majority in the Dessau city council deliberated the dissolution of the Bauhaus in 1932, Schlemmer began painting the \'Bauhaus Stairway\', meanwhile long an iconic image (Museum of Modern Art, New York). In the process, he drew on earlier studies, especially this delicate watercolour sketch. The figures calmly climb the stairway of the Dessau Bauhaus. They look timeless, de-individualized, in harmony with one another and their architectural setting. The work is a programmatic formulation of the underlying Bauhaus idea--the unity of the human being and architecture.', 'Oskar Schlemmer', '1931 - 1932', 'paper', 'drawn', '279 x 219 mm', 3, 14),
('https://sammlung.staedelmuseum.de/images/102022/max-beckmann-bank-main-and-church-lg69--thumb-lg.jpg', 'Bank of the Main and Church', 'drawing', 'This vertical-format work shows a view of the Sachsenhausen bank of the Main River and the eye-catching tower of the Dreik?nigskirche. Beckmann\'s flat and his studio in Schweizer Strasse were just steps away from the Eiserner Steg footbridge, whose railing can be seen as a detail at the lower edge of the picture. The bank of the river with its spacious storage yard is deserted; a few boats are moored motionless in the water. The row of trees fringing the embankment of Schaumainkai obscures the view of the street. The vast cloud formation spreading across the bright sky alongside the strong vertical of the Neo-Gothic tower lends the picture a threatening atmosphere.', 'Max Beckmann', '1925', 'paper', 'drawn', '67.5 x 45 cm', 3, 15),
('https://sammlung.staedelmuseum.de/images/11716/ernst-ludwig-kirchner-berlin-street-scene-16069z--thumb-lg.jpg', 'Berlin Street Scene', 'drawing', 'The foreground of the scene is dominated by an arrangement of three elongated figures, who take up the entire height of the picture surface. With dynamic, rapid strokes, the artist has characterised a man dressed in a coat and hat and two fashionably dressed women. The women\'s outfits, the feather hats, the costume with the overlarge collar, and the high-heeled shoes are immediately eye-catching. The way they are posing and their mask-like faces - highlighted in a garish, pale blue and alertly registering their surroundings - make it clear that they are prostitutes. The scene derives its aggressive character from the jagged forms ending in acute angles and the dominant colours: black, the turquoise of the costume, the purple of the punter\'s hat and trousers, but above all from the sulphur-yellow light that surrounds them. A suggestive aspect is provided behind the right-hand figure by the phalanx of extended male legs running parallel to each other as they descend into the depths of an otherwise undefined space - a feature that recurs in the painting \'Friedrichstra?e\' (1914, Staatsgalerie Stuttgart). The energetically charged tension is, however, immediately converted into the powerful execution and intensity of the pastel colours in the drawing. The artist\'s gaze at the challenging eroticism of big-city civilisation is considerably different from the natural sensuousness of the works he created in Dresden and on Fehmarn. A drawing such as his \'Berlin Street Scene\' colours our impression of the mood in the German metropolis on the eve of the First World War.', 'Ernst Ludwig Kirchner', '1914', 'paper', 'drawn', '677 x 503 mm', 3, 16),
('https://sammlung.staedelmuseum.de/images/102064/willi-sitte-blick-auf-kroellwitz-2329--thumb-lg.jpg', 'Blick auf Krollwitz', 'drawing', 'The viewer gets to see very little of Krollwitz, a suburb of Halle an der Saale. In earthy shades of brown and ochre, he is presented instead a gloomy backyard scenario of roofs, facades and strangely lifeless-looking tree structures. A bulky, metallic grey, equine-looking mass rises up in the right foreground of the picture. Its faceted surface recalls Cubism and, as an abstract element, provides an exciting contrast to the world of objects. Willi Sitte\'s early work in particular is rich in allusions, yet much remains strangely unspoken. The artist repeatedly alienates his unattractive, monumental scenarios, contrasting strong planarity with spatial depth and making modelled corporeality clash with the ornamental. Sitte is one of the most prominent, but also most colourful, figures among the painters of the GDR. As he rose in the Communist Party nomenklatura, his initial openness, searching and non-conformity gave way to a realism which consciously took into account his proximity to the state and the political services he was called upon to perform.', 'Willi Sitte', '1958', 'paper', 'drawn', '99 x 79.5 cm', 3, 17),
('https://sammlung.staedelmuseum.de/images/104143/blinky-palermo-blue-triangle-db123a-cd--thumb-lg.jpg', 'Blue Triangle', 'drawing', 'Blinky Palermo not only created the work, but also provided the assembly instructions. \'Blue Triangle\' is the simple material for an interactive artwork as defined by Minimal Art. In the text accompanying this work, the artist invites the viewer to lend a hand himself. The result is that individual artistic gestures lose some of their validity. The choice of position which the protagonist decides on is of fundamental significance. Palermo repeatedly undertook visual changes in the form of various geometrical wall paintings. He wanted to set a new standard of seeing in the Constructivist style. At the same time, the art market is subverted through the demand to pass on the original, in that a tradable commodity no longer exists. Even though the artist, who died at the early age of thirty-six, did not want to be classified within any kind of \'-ism\', he consciously moved in the field of tension between Minimal Art and Fluxus.', 'Blinky Palermo', '1969', 'paper', 'drawn', '485 x 535 mm', 3, 18),
('https://sammlung.staedelmuseum.de/images/105896/frank-nitsche-bmc-7-2392--thumb-lg.jpg', 'BMC-7', 'drawing', '\"BMC-7\", a pictorial construction of curved lines, surfaces and forms, seems extremely peculiar despite the pastel colouring and the smooth colour transitions. Like the numerically abbreviated title, the abstract structure cannot be deciphered. It consists of fragments of several pictures that Frank Nitsche has taken from newspapers and magazines and painted together in such a way that a new form emerges that does not allow any conclusions to be drawn about the origin of the parts. Only in the artist\'s studio does the inventory of the pictures reveal itself. There, Nitsche has compiled an enormous database in which images of terror, accidents and environmental catastrophes can be seen in the immediate vicinity of film shots and images of medical interventions -- a mixture of images that, in Nitsches\' adaptation, acquires an elegant yet unsettling lightness.', 'Frank Nitsche', '1999', 'paper', 'drawn', '155 x 135 cm', 3, 19),
('https://sammlung.staedelmuseum.de/images/113838/georg-herold-brick-negro-2457--thumb-lg.jpg', 'Brick negro', 'drawing', 'George Herold takes up one aspect of the typical repertoire of German painting from the 1980s: namely a marginal, violent and often tasteless provocation. This depiction deliberately displays political incorrectness: An aggressive mob is using a brick to attack a Black man. The traffic light seems to be giving a green light for the attack. The likewise blatantly racist tile can be read as an attempt by the artist to investigate a general concern of (political) art: namely the question of what art is permitted to do and where its freedom comes to an end. Even at a remove of four decades, the viewer must ask himself whether the artist was using the racist statement of the work and its title to refer to himself. Even if we do not impute a racist background to the artist, both the title and the work -- if we take them at their word -- are scandalous. And they issue a challenge to both art-historical classification and the exhibiting of art, which deliberately rejects an access devoid of ambiguity or an assertion based on contents.', 'Georg Herold', '1981', 'paper', 'drawn', '90 x 130 cm', 3, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `renaissance`
--

CREATE TABLE `renaissance` (
  `image` mediumtext NOT NULL,
  `title` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `description` text NOT NULL,
  `author` mediumtext NOT NULL,
  `date` mediumtext NOT NULL,
  `materials` mediumtext NOT NULL,
  `technique` mediumtext NOT NULL,
  `dimensions` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `renaissance`
--

INSERT INTO `renaissance` (`image`, `title`, `type`, `description`, `author`, `date`, `materials`, `technique`, `dimensions`, `category`, `ID`) VALUES
('https://sammlung.staedelmuseum.de/images/3306/albrecht-altdorfer-adoration-magi-1-sg452--thumb-lg.jpg', 'The Adoration of the Magi', 'drawing', 'Altdorfer was born in Regensburg and is the most important representative of the so-called Danube School. This late work is characteristic of its style. The figures and the setting fuse to create a festive scene. Maria\'s mantle and head covering flow in voluptuous folds, and the Three Kings are opulently dressed. The architecture of the ruins, shown in great detail, is intricate and overgrown with climbing plants. Even the sky is decorated. Extravagant perspectives like the Star of Bethlehem, depicted from below, and the wooden beams above the dark-skinned king heighten the decorative effect.', 'Albrecht Altdorfer', '1530 - 1535', 'paper', 'drawn', '109.2 x 77.3 cm', 1, 1),
('https://sammlung.staedelmuseum.de/images/837/carlo-crivelli-angel-annunciation-841--thumb-xl.jpg', 'The Angel of the Annunciation', 'drawing', 'The two immaculately preserved panels depict with great attention to detail the events leading to the Incarnation of Christ. Together with a Risen Christ (today in the Abegg-Foundation in Riggisberg), they originally served as the top sections of a four-part altarpiece which Crivelli painted in 1482 for a church in the town of Camerino, in the Italian region of Marche. The main panels of this polyptych, which was separated into its individual parts in the nineteenth century, showed the Madonna enthroned with the Child and Saints Peter and Dominic, as well as St Peter the Martyr and Venantius; the predella was decorated with further images of saints (today in Milan and Venice).', 'Carlo Crivelli', '1482', 'paper', 'drawn', '36.4 x 44.5 cm', 1, 2),
('https://sammlung.staedelmuseum.de/images/249/braunschweiger-monogrammist-brothel-scene-249--thumb-xl.jpg', 'Brothel Scene', 'drawing', 'The bordello picture is a typical work of the artist, who was active in Antwerp during the second quarter of the sixteenth century and who is known by a name of convenience as the \"Brunswick Monogrammist\". His oeuvre consists of small-format biblical scenes containing numerous figures and of works showing \"loose society\" with a sociocritical element or critical of the Church. In St?del\'s collection the picture was attributed to Hans Holbein the Younger. The collector was no doubt persuaded to purchase the panel picture for its evident genre-like character.', 'The Brunswick Monogrammist', '1540 - 1550', 'paper', 'drawn', '32.7 x 45.5 cm', 1, 3),
('https://sammlung.staedelmuseum.de/images/7204/giulio-romano-cephalus-grieves-procris-4336z--thumb-xl.jpg', 'Cephalus Grieves for Procris', 'drawing', 'Ovid tells of Cephalus, the enthusiastic hunter who spent so much time in the forest that one day his jealous wife Procris came after him. He saw the bush move, hurled his lance at the supposed game and killed his beloved wife. The drawing shows the mourning of Cephalus, in which the mythical creatures of the forest, the satyrs and nymphs, participate. It looks like a relief, a stylistic device that the artist has adopted from antique sarcophagus sculptures.', 'Giulio Romano', '1530', 'paper', 'drawn', '326 x 563 mm', 1, 4),
('https://sammlung.staedelmuseum.de/images/1708/lucas-cranach-d-ae-christ-blessing-children-1723--thumb-lg.jpg', 'Christ Blessing the Children', 'drawing', 'This painting is one of Cranach\'s best-loved works; some twenty treatments of the subject by him have survived. Christ\'s blessing of the children is a typically Protestant subject, for it illustrates Luther\'s view that the way to heaven is not through good works (to be performed largely by adults) but through faith alone, understood as an act of divine grace. Although the work presumably did not come into the Holzhausens\' possession until 1810, later nineteenth-century members of that family thought they recognised their own ancestors in the children shown in the picture.', 'Lucas Cranach the Elder', '1535 - 1540', 'paper', 'drawn', '83.8 x 121.5 cm', 1, 5),
('https://sammlung.staedelmuseum.de/images/849/giovanni-bellini-und-werkstatt-madonna-and-child-saints-john-853--thumb-lg.jpg', 'Madonna and Child with Saints John the Baptist and Elizabeth', 'drawing', 'The Mother of God and the Christ Child are in the company of John the Baptist and his mother, Elizabeth. This devotional painting radiates quietude of a virtually sublime character. The pictorial type known as \"sacra conversazione\" (sacred conversation) was extremely popular. Successful artists like Bellini produced several versions of it, combining figures based on standardised models. This explains why Elizabeth and John cannot see the Infant Jesus, but only Mary\'s back. The painting undoubtedly owes its aura in good part to the brilliant blue produced from the precious lapis lazuli.', 'Giovanni Bellini', '1490 - 1500', 'paper', 'drawn', '72 x 90 cm', 1, 6),
('https://sammlung.staedelmuseum.de/images/1714/conrad-faber-von-kreuznach-double-portrait-justinian-von-hol-1729--thumb-lg.jpg', 'Double Portrait of Justinian von Holzhausen and His Wife Anna, nee Furstenberg', 'drawing', 'Conrad Faber was the \"house painter\" of the Frankfurt patriciate in the first half of the sixteenth century. This double portrait holds a prominent position among his innumerable likenesses, of which many are quite formulaic in nature. Justinian von Holzhausen, a man of humanist learning, had it painted of himself and his wife. The winged Cupid is unique in painting north of the Alps. With its arrow and bunches of grapes, it invokes sensual love as the foundation of marriage ?V an astonishingly candid reference to sexuality for the time in which the picture was painted.', 'Conrad Faber von Kreuznach', '1536', 'paper', 'drawn', '68.6 x 98.5 cm', 1, 7),
('https://sammlung.staedelmuseum.de/images/1563/hieronymus-bosch-ecce-homo-1577--thumb-lg.jpg', 'Ecce Homo', 'drawing', 'The painting of Jesus being presented to the people after his scourging was commissioned by a family originally depicted in the lower corners. These sections were damaged and overpainted at an early date, and the remnants of the figures now visible were uncovered only a few years ago. The variation in size is a reflection of status. The children are much smaller in scale than both the father and one of the sons, whose tonsure identifies him as a monk. It is this son who virtually ??utters?? the Latin inscription formulating the donor family\'s prayer: \"Redeem us, Christ, Saviour.\"', 'Hieronymus Bosch', '1490', 'paper', 'drawn', '71.1 x 60.5 cm', 1, 8),
('https://sammlung.staedelmuseum.de/images/102055/hans-holbein-d-ae-exterior-wings-frankfurt-dominican-altarpi-hm6-9--thumb-lg.jpg', 'Exterior Wings of the Frankfurt Dominican Altarpiece', 'drawing', 'For the Dominicans Holbein added a parallel image to the \"Tree of Jesse\": Beginning with the order\'s founder Dominic, he presents a spiritual family tree of all the saints that emerged from within the order\'s ranks. In the ecclesiastical rivalry with the Frankfurt Carmelites and Franciscans, the Dominicans thus presented themselves to the faithful as effective intermediaries for salvation. The painting succinctly illustrates the Dominicans\' privileged access to heaven in the centre of the composition: The Blessed Virgin Mary herself bestows the white scapular on the Dominican Saint Reginald of Orleans as part of his monastic habit.', 'Hans Holbein the Elder', '1501', 'paper', 'drawn', '349 x 322 cm', 1, 9),
('https://sammlung.staedelmuseum.de/images/1483/parmigianino-female-martyr-angels-1496--thumb-lg.jpg', 'Female Martyr with Angels (Saint Catherine of Alexandria?)', 'drawing', 'This small-format panel painting by the Italian master Parmigianino shows a young woman sitting elegantly on the forest floor. She is accompanied by two nude boys, putti or angels, who are busy with a palm frond. The young woman is holding a twig in her left hand in a delicate gesture; her robe of white and brown fabric falls gracefully around her body. The scene is so charming that we scarcely notice how overdrawn the young woman\'s legs are, or that the head of the boy on the right-hand edge of the picture is extremely overwrought. Parmigianino consciously sacrificed the proportions in favour of artistic expression and a composition which links all three figures together.', 'Parmigianino', '1523 - 1524', 'paper', 'drawn', '25.6 x 17.3 cm', 1, 10),
('https://sammlung.staedelmuseum.de/images/4990/albrecht-duerer-four-naked-women-four-witches-31389d--thumb-lg.jpg', 'Four Naked Women (The Four Witches)', 'drawing', 'The exact meaning of this mysterious depiction is unknown. It may be a New Year\'s greeting with symbolic content. At any rate, it offers clear evidence of Durer\'s interest in anatomical studies. The demon of hell in the doorway at the left holds an oblong clamp trap of the kind used for catching birds. From other depictions of this instrument, we know that the devilish figure is lying in wait not for the women, but for lustful viewers.', 'Albrecht D?rer', '1496 - 1497', 'paper', 'drawn', '193 x 136 mm', 1, 11),
('https://sammlung.staedelmuseum.de/images/1369/pietro-perugino-werkstatt-madonna-infant-st-john-and-angel-1379--thumb-lg.jpg', 'The Madonna, the Infant St. John and the Angel, Worshipping the Christ Child', 'drawing', 'The composition and style of this small-format devotional picture are closely related to Perugino\'s earlier autograph works. The figure of the Virgin kneeling in the centre of the composition, the Christ Child propped up by a white bolster, the naked infant Saint John and even the wide landscape, complete with ox and ass, were lifted from different compositions by the master and reassembled. The work most closely parallels the Madonna del Sacco (Galleria Palatina, Florence). This kind of recombination of workshop cartoons and drawings was not unusual at the time -- even great masters, Perugino included, often fell back on their own pool of drawings and replicated the most popular elements.', 'Pietro Perugino', '1510', 'paper', 'drawn', '45.5 x 35.7 cm', 1, 12),
('https://sammlung.staedelmuseum.de/images/969/garofalo-holy-family-1-976--thumb-lg.jpg', 'The Holy Family', 'drawing', 'The Italian painter Benvenuto Tisi was given the sobriquet \"Il Garofalo\" because of the carnation in his crest. He spent his entire life travelling throughout Italy in order to work together with a wide variety of contemporary artists. This painting shows an interior with coloured tiles in which the Holy Family has taken up its positions. The elderly Joseph is sitting on a wooden bench and has dozed off. The Virgin Mary is sitting on the floor and is holding the Infant Jesus in her lap. She has extended her right hand towards the flames which are flickering upwards from the embers in a portable stove. With one leg bent and his head turned to the side, the Christ Child seems literally to be writhing.', 'Garofalo', '1515 - 1520', 'paper', 'drawn', '53.3 x 81.1 cm', 1, 13),
('https://sammlung.staedelmuseum.de/images/102152/hans-holbein-d-ae-high-altar-dominican-church-frankfurt-1-hm6-20+lg1--thumb-lg.jpg', 'High Altar of the Dominican Church in Frankfurt', 'drawing', 'With its Passion cycle and scenes from the Life of the Virgin, Holbein\'s Dominican altarpiece not only presents a detailed illustration of the story of Christ the saviour, it also stands as striking testimony to the hateful visual propaganda of the Frankfurt Dominicans. In the depictions of Christ\'s Passion, the monastery sought to attack the Jewish community that was consigned to live in the nearby ghetto. The Dominican spiritual \"family tree\", on the other hand, was intended to promote the order\'s status in relation to the rival Christian monastic orders in Frankfurt.', 'Hans Holbein the Elder', '1501', 'paper', 'drawn', '349 x 322 cm', 1, 14),
('https://sammlung.staedelmuseum.de/images/3303/meister-des-bartholomaeusaltars-holy-family-2-sg449--thumb-lg.jpg', 'The Holy Family with the Dragonfly', 'drawing', 'Seated on a \"grassy bank\", the Mother of God fondles her child. Behind them at the left, Saint Joseph has fallen asleep. Beyond the garden enclosed by a gate and a wall, a landscape with mountains and the sea, buildings and ships spreads out in the background. The little dragonfly at the lower right can be read as a reference to the importance of studying nature. Durer\'s monogram at the bottom edge has not yet developed to its final form.', 'Albrecht Durer', '1495', 'paper', 'drawn', '237 x 185 mm', 1, 15),
('https://sammlung.staedelmuseum.de/images/2323/lucas-cranach-d-ae-holy-kinship-1398a--thumb-lg.jpg', 'The Holy Kinship', 'drawing', 'Among the earliest major commissions which Lucas Cranach the Elder carried out in 1509 as court painter to the Electorate of Saxony was the so-called Torgau Altar. The altar was acquired with the help of several sponsors in 1906 at the auction of the Molinier Collection in Paris. The money required to secure this magnificent work for Frankfurt was provided jointly by the City of Frankfurt, private art lovers, the Stadelscher Museums-Verein and the recently founded Carl Schaub\'sche Stiftung. For Cranach researchers, its arrival at the museum was a small sensation: although the altar clearly bore the signature of the master himself, the work was previously unknown in the relevant literature on the artist.', 'Lucas Cranach the Elder', '1509', 'paper', 'drawn', '120 x 99 cm', 1, 16),
('https://sammlung.staedelmuseum.de/images/28251/lucas-cranach-d-ae-holy-kinship-so-called-torgau-altarpiece-1398--thumb-lg.jpg', 'The Holy Kinship (so-called \"Torgau Altarpiece\")', 'drawing', 'This triptych was one of Cranach\'s first major commissions as court painter to the elector of Saxony in Wittenberg. It treats the popular subject of the \"Holy Kinship\", the legendary relationship between the Virgin and the mothers of some of the apostles. Disguised within the sacred motif is a political declaration by the Saxon rulers, who have lent their features to the two men shown on the wings. Frederick the Wise and John the Constant thus express their loyalty to Emperor Maximilian, who appears as one of Anna\'s husbands in the gallery in the central picture.', 'Lucas Cranach the Elder', '1509', 'paper', 'drawn', '130.5 x 110.5 cm', 1, 17),
('https://sammlung.staedelmuseum.de/images/930/sandro-botticelli-idealised-portrait-lady-936--thumb-lg.jpg', 'Idealised Portrait of a Lady (Portrait of Simonetta Vespucci as Nymph)', 'drawing', 'The fantastical accoutrements in this larger-than-life-size half-length painting of a young lady make it clear that it is not a likeness in the strict sense, but an ideal portrait in the mythological guise of a nymph. Shown in profile, the young woman displays the features of Simonetta Vespucci, the prematurely deceased mistress of Giuliano de\' Medici. The pendant on her necklace also places her in the immediate circle of the Medici, imitating a famous ancient cameo which was in that family\'s collection.', 'Sandro Botticelli', '1480 - 1485', 'paper', 'drawn', '81.3 x 54 cm', 1, 18),
('https://sammlung.staedelmuseum.de/images/885/albrecht-duerer-job-dungheap-890--thumb-lg.jpg', 'Job on the Dungheap', 'drawing', 'Along with the depiction of two musicians (Cologne, Wallraf-Richartz-Museum) this panel -- later trimmed at the top -- once formed the exterior of an altar retable. Job is an Old Testament figure who is repeatedly smitten with bad luck and tested by God. Here, he endures his trials on a dung heap, accompanied by his wife and friends. The latter attempt to cheer him up with music, while his spouse administers a jet of water to her sick husband in what may be an allusion to the \'Bath of Job\' chapel in Annaberg, Saxony, presumably the painting\'s original location.', 'Albrecht D?rer', '1505', 'paper', 'drawn', '96 x 51.5 cm', 1, 19),
('https://sammlung.staedelmuseum.de/images/945/rosso-fiorentino-madonna-and-child-infant-st-john-1-952--thumb-lg.jpg', 'Madonna and Child with the Infant St. John', 'drawing', 'This painting is one of the earliest works by the great Florentine Mannerist artist. His inimitable style can be recognised not only in the rapid painting method and the preliminary markings of the composition, which have intentionally been left visible. It is also revealed in the undisguised use of a pagan reference from antiquity for a religious subject. Modelled on Hellenistic representations of Venus, Rosso Fiorentino\'s portrayal of the Virgin Mary, with her close-fitting robe following the outline of every detail of her body, was doubtless shocking to many of his contemporaries. The two children are reminiscent of Amor and the youthful Bacchus.', 'Rosso Fiorentino', '1515', 'paper', 'drawn', '102.1 x 77.5 cm', 1, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `romance`
--

CREATE TABLE `romance` (
  `image` mediumtext NOT NULL,
  `title` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `description` text NOT NULL,
  `author` mediumtext NOT NULL,
  `date` mediumtext NOT NULL,
  `materials` mediumtext NOT NULL,
  `technique` mediumtext NOT NULL,
  `dimensions` mediumtext NOT NULL,
  `category` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `romance`
--

INSERT INTO `romance` (`image`, `title`, `type`, `description`, `author`, `date`, `materials`, `technique`, `dimensions`, `category`, `ID`) VALUES
('https://sammlung.staedelmuseum.de/images/3196/venezianischer-meister-des-18-jahrhunderts-adoration-golden-sg350--thumb-lg.jpg', 'The Adoration of the Golden Calf', 'drawing', 'Ludwig Josef Pfungst, a businessman in Worms, died on 4 July 1905. A childless bachelor, he left his entire art collection and his fortune of around a million marks to the city of Frankfurt. It was his wish that the interest on the money be used to purchase works of contemporary art. This legacy was a major factor leading to the foundation of the Stadtische Galerie, which has been part of the Stadelsches Kunstinstitut since 1907. Still in existence today, the Pfungst Foundation now mainly supports purchases of modern art for the Stadel museum\'s Collection of Prints and Drawings.', 'Venetian Master', '1701 - 1750', 'paper', 'drawn', '31.6 x 41.7 cm', 2, 1),
('https://sammlung.staedelmuseum.de/images/1188/januarius-zick-adoration-shepherds-1-1198--thumb-lg.jpg', 'The Adoration of the Shepherds', 'drawing', 'In accordance with the statutes laid down by its founder, the Stadelsches Kunst-Institut is overseen by an independent administrative body consisting of five individuals, all of them \"worthy persons from among the local citizenry\". Moritz Gontard had been a long-serving member of the administration who is remembered at the Stadel to this day as the donor of Lucas Cranach\'s \'Venus\'. At Christmas 1886, following Gontard\'s sudden death, Jakob Klein-Hoff was elected to take his place. Klein-Hoff continued the honourable tradition of donating to the museum.', 'Januarius Zick', '1765', 'paper', 'drawn', '88.2 x 125.1 cm', 2, 2),
('https://sammlung.staedelmuseum.de/images/3242/maurice-denis-breakfast-sg392--thumb-lg.jpg', 'Breakfast', 'drawing', 'An idyllic breakfast: the blissful-looking family of the Nabis artist is seated around a table by the window which affords a view across a bay. The figures are shown close to the viewer and form a compact unit. Thanks to their stylistic homogeneity, the patterns on the fabric of the clothing and the tablecloth fuse to form a decorative surface, whereby the identical patterns on the dresses of the mother and the younger daughter blend into each other. This work reflects Denis\'s view that a painting is primarily a surface covered with paint in a certain arrangement rather than the rendering of a subject.', 'Maurice Denis', '1901', 'paper', 'drawn', '51.3 x 66.5 cm', 2, 3),
('https://sammlung.staedelmuseum.de/images/1796/henri-evenepoel-cafe-dharcourt-paris-1811--thumb-lg.jpg', 'In the Cafe d\'Harcourt in Paris', 'drawing', 'Once located on the Parisian Place de la Sorbonne, the Cafe d\'Harcourt was closed down in 1940. Parisian bohemians and ladies of easy virtue pass the time smoking and drinking. A young woman in a red dress buoyantly makes her way through their midst. Her conspicuous outfit belies the shy gaze with which she searchingly surveys the room. Yet nobody takes notice of her. In fact, there is no communication at all between the guests. Here, Evenepoel describes turn-of-the-century Paris as a jaded and decadent society.', 'Henri Evenepoel', '1897', 'paper', 'drawn', '114 x 148 cm', 2, 4),
('https://sammlung.staedelmuseum.de/images/730/pompeo-girolamo-batoni-allegory-arts-731--thumb-lg.jpg', 'Allegory of the Arts', 'drawing', 'The painting shows five women who embody the arts. Painting is sitting by the easel at the centre of the composition. She has turned towards Poetry, who is standing behind and who provides her with inspiration. Sculpture is sitting at front left and gazes admiringly up at Painting. Architecture and Music have retreated into the background. The Roman artist Batoni also illustrates the supremacy of Painting within the arts with his refined, almost classical-looking style, which disguises every brushstroke.', 'Pompeo Girolamo Batoni', '1740', 'paper', 'drawn', '175.4 x 138 cm', 2, 5),
('https://sammlung.staedelmuseum.de/images/1539/gustave-dore-alpine-landscape-beck-1553--thumb-lg.jpg', 'Alpine Landscape with Beck', 'drawing', 'In 1918, a century after the death of the museumes founder, Johann Friedrich Stadel, Johann Georg Clauer and his wife, residents of Frankfurt\'s Westend district, carried on the tradition of patronage initiated by Stadel: they donated fifteen works, which the museum was free either to add to its collection or to sell. The museumes administration decided to keep five for the collection, while the proceeds from selling the other ten enabled it to purchase works such as this Dore painting \"with funds from the bequest of Johann Georg Clauer and his wife\".', 'Gustave Dor?', '1870', 'paper', 'drawn', '130 x 97 cm', 2, 6),
('https://sammlung.staedelmuseum.de/images/1545/giovanni-segantini-alpine-landscape-sunset-1559--thumb-lg.jpg', 'Alpine Landscape at Sunset', 'drawing', 'Native painting or avant-garde? Or perhaps even both? Alongside Hodler and Kirchner, Segantini is considered to be the most important chronicler of life in the High Alps. He was raised in poverty and later celebrated for his sentimental depictions of farm life, in which he combined aspects of Realism and Symbolism. This painting is a smaller version of his unfinished chef d\'oeuvre \'Life, Nature and Death\'. Depicting a herd of sheep in the Engadine Mountains being driven home in the evening, Segantini is addressing the harmony of man and nature.', 'Giovanni Segantini', '1895 - 1898', 'paper', 'drawn', '86 x 137.5 cm', 2, 7),
('https://sammlung.staedelmuseum.de/images/1370/adolf-schreyer-arabs-resting-marble-fountain-1380--thumb-lg.jpg', 'Arabs Resting by a Marble Fountain', 'drawing', 'It was the executor who notified the administration that the gentleman of private means Johann Georg Cronhardt (d. 1904) had bequeathed them this painting. Cronhardt had inherited the work from Georg Seufferheld (1813 - 1874), whose will in 1874 had also revealed that a noteworthy oeuvre of Dutch Baroque painting should be left to the St?del: Aert van der Neer??s wonderful painting of the night.', 'Adolf Schreyer', '1856', 'paper', 'drawn', '63.5 x 126.8 cm', 2, 8),
('https://sammlung.staedelmuseum.de/images/1516/hubert-robert-artists-studio-1530--thumb-lg.jpg', 'The Artis\'s Studio', 'drawing', 'Hubert Robert came to Rome, the Eternal City, in 1753 in the entourage of the French ambassador. His patron, the Duc de Choiseul, recommended him for a place at the prestigious Academie de France. This painting probably dates from Robert\'s period of study in Rome, for while it is artistically ambitious there are flaws in the perspective. It is perhaps no accident that he has depicted an artist working on a relief: Robert, who was to become such an important painter of architecture and townscapes, had learned drawing from a Parisian sculptor.', 'Hubert Robert', '1760', 'paper', 'drawn', '56.5 x 72.7 cm', 2, 9),
('https://sammlung.staedelmuseum.de/images/1105/philipp-veit-arts-being-introduced-germany-christianity-1114--thumb-lg.jpg', 'The Arts Being Introduced to Germany by Christianity', 'drawing', 'In the view of the Nazarene Philipp Veit, who was appointed director of the Stadelsches Kunstinstitut in Frankfurt in 1830, the art of the future should be based entirely on the Christian Middle Ages. His fresco, which was transferred to canvas, shows an allegorical representation of the arts in the spirit of Christianity. Religion is represented by the pious female figure in the middle of the picture. With reference to the Bible, she breathes life into the three sister arts Painting, Sculpture and Architecture in the background and into Poetry, Music and Chivalry in the foreground on the left. The figures on the right edge of the picture observe the scene reverently as they wait to be converted by the sermon of St Boniface. An aged bard, symbolising the heathen cult, is bending low over his harp at front right. His position in the shadows and the broken strings of his instrument show that the end of his era has come. The fresco originally adorned the old premises of the Institute in Neue Mainzer Stra?e. There, too, the centre panel of the three-part work accompanied the allegories Germania and Italia. They represent the long-standing unity of the peoples of Germany and Italy.', 'Philipp Veit', '1834 - 1836', 'paper', 'drawn', '284 x 611.5 cm', 2, 10),
('https://sammlung.staedelmuseum.de/images/8956/johann-heinrich-ramberg-ball-game-rome-1573z--thumb-lg.jpg', 'Ball Game in Rome', 'drawing', 'In March 1815, the Frankfurt businessman and banker Johann Friedrich Stadel bequeathed his entire fortune and art collection to a foundation which was to be named after him: the \'Stadelsches Kunstinstitut\'. However, he also dedicated the foundation to the citizens of Frankfurt immaterially, wishing it to be an \"adornment and of practical use\" to Frankfurt\'s citizenry. He was thus the first ordinary citizen in the German-speaking region to found a public art museum: the present-day Stadel Museum. When he died, his collection comprised 476 paintings, some 4,600 drawings, almost 10,000 printed graphics and valuable books.', 'Johann Heinrich Ramberg', '1797', 'paper', 'drawn', '443 x 552 cm', 2, 11),
('https://sammlung.staedelmuseum.de/images/90/barent-fabritius-birth-and-naming-st-john-baptist-90--thumb-lg.jpg', 'The Birth and Naming of St John the Baptist', 'drawing', 'In March 1815, the Frankfurt businessman and banker Johann Friedrich Stadel bequeathed his entire fortune and art collection to a foundation which was to be named after him: the \'Stadelsches Kunstinstitut\'. However, he also dedicated the foundation to the citizens of Frankfurt immaterially, wishing it to be an \"adornment and of practical use\" to Frankfurt\'s citizenry. He was thus the first ordinary citizen in the German-speaking region to found a public art museum: the present-day Stadel Museum. When he died, his collection comprised 476 paintings, some 4,600 drawings, almost 10,000 printed graphics and valuable books.', 'Barent Fabritius', '1660 - 1669', 'paper', 'drawn', '64.8 x 76.2 cm', 2, 12),
('https://sammlung.staedelmuseum.de/images/1067/adriaen-brouwer-bitter-potion-1076--thumb-lg.jpg', 'The Bitter Potion', 'drawing', 'An artist highly appreciated by Rubens, Brouwer worked in Antwerp from 1631 until his premature death. This half-length painting of a crudely dressed young man probably dates from Brouwer\'s final years and is one of his most important works. The young man has obviously just taken some bitter medicine, for his contorted face expresses deep and utter disgust. In this representation of the sense of taste, Brouwer departs markedly from pictorial tradition: taste was normally symbolised by figures eating savoury foods.', 'Adriaen Brouwer', '1636 - 1638', 'paper', 'drawn', '47.3 x 35.5 cm', 2, 13),
('https://sammlung.staedelmuseum.de/images/1373/rembrandt-harmensz-van-rijn-blinding-samson-1383--thumb-lg.jpg', 'The Blinding of Samson', 'drawing', 'What violence! What drama! The superhuman strength with which God endowed the Old Testament judge Samson resides in his uncut hair. His mistress, Delilah, a Philistine, has coaxed this secret from him. She shaves his head and calls her countrymen, who lose no time in pouncing on the hero thus robbed of his might. They tie him up and gouge out his eyes. Illuminated with a harsh beam of the kind cast by a spotlight, the ghastly scene has a stage-like quality. Delilah looks back at her victim with an expression of triumph, fascination and disgust.', 'Rembrandt Harmensz. van Rijn', '1636', 'paper', 'drawn', '219.3 x 305 cm', 2, 14),
('https://sammlung.staedelmuseum.de/images/143/jacob-jordaens-adoration-shepherds-143--thumb-lg.jpg', 'The Adoration of the Shepherds', 'drawing', 'In March 1815, the Frankfurt businessman and banker Johann Friedrich Stadel bequeathed his entire fortune and art collection to a foundation which was to be named after him: the \'Stadelsches Kunstinstitut\'. However, he also dedicated the foundation to the citizens of Frankfurt immaterially, wishing it to be an \"adornment and of practical use\" to Frankfurt\'s citizenry. He was thus the first ordinary citizen in the German-speaking region to found a public art museum: the present-day Stadel Museum. When he died, his collection comprised 476 paintings, some 4,600 drawings, almost 10,000 printed graphics and valuable books.', 'Jacob Jordaens', '1815', 'paper', 'drawn', '71.5 x 92.7 cm', 2, 15),
('https://sammlung.staedelmuseum.de/images/3018/auguste-renoir-after-luncheon-sg176--thumb-lg.jpg', 'After the Luncheon', 'drawing', 'In the arbour of a Parisian restaurant, an abundant meal is drawing to a close. The actress Ellen Andree has taken the last sip of her after-dinner drink; lost in thought, she clings to its lingering taste. One of Renoir\'s models is perched on the back of the bench and watches expectantly as the artist\'s brother lights a cigarette with obvious satisfaction. There is a lull in the otherwise lively conversation. With great mastery, Renoir has captured the ephemeral impression on canvas in a seemingly spontaneous \"snapshot\".', 'Auguste Renoir', '1879', 'paper', 'drawn', '100.5 x 81.3 cm', 2, 16),
('https://sammlung.staedelmuseum.de/images/975/johann-anton-ramboux-capuchin-sermon-colosseum-rome-982--thumb-lg.jpg', 'Capuchin Sermon at the Colosseum of Rome', 'drawing', 'The arena of cruel, pagan public amusement in antiquity has become a place of Christian faith. Various groups of believers are scattered across the vast oval of the ruined Colosseum. A wooden cross rises in the centre of the monument, which Pope Benedict XIV had dedicated during the eighteenth century as a place of memorial for Christian martyrs by installing the Stations of the Cross. Ramboux - a pupil of the Classical painter Jacques-Louis David - lived in Italy for several years. In addition to his own artistic activities, he also made an in-depth academic study of the art of antiquity and the Middle Ages.', 'Johann Anton Ramboux', '1822', 'paper', 'drawn', '56 x 88 cm', 2, 17),
('https://sammlung.staedelmuseum.de/images/1000/giovanni-domenico-tiepolo-continence-scipio-1009--thumb-lg.jpg', 'The Continence of Scipio', 'drawing', 'The Roman general Scipio had been promised a beautiful young girl in return for conquering a city. But he returned the young woman to her betrothed and gave them the ransom he had been offered for the wedding. Giovanni Domenico Tiepolo, the son of the even better-known painter Giovanni Battista Tiepolo, shows Scipio half turned away from the viewer, with a red cloak over his shoulders and the general\'s staff in his right hand. Before him stand the young bride in her finery and the bridegroom, who is putting a ring on her finger. Tiepolo has staged this moving episode from Roman history like a scene in a play.', 'Giovanni Domenico Tiepolo', '1751', 'paper', 'drawn', '120.5 x 98 cm', 2, 18),
('https://sammlung.staedelmuseum.de/images/1341/max-liebermann-courtyard-orphanage-amsterdam-1351--thumb-lg.jpg', 'The Courtyard of the Orphanage in Amsterdam: Free Period in the Amsterdam Orphanage', 'drawing', 'Conservative circles taunted Liebermann as the \"apostle of ugliness\". Nevertheless, the Stadelscher Museums-Verein showed courage and providence when it acquired this early key work immediately after it was founded in 1899. Liebermann had sketched the inmates of the \'Burgerweeshuis\' in Amsterdam. It was only later that he executed the oil painting in his Munich studio. This work was created at a turning point, when Liebermann left behind the shades of brown of his realist phase and adopted the lighter palette of Impressionism.', 'Max Liebermann', '1881 - 1882', 'paper', 'drawn', '78.5 x 107.5 cm', 2, 19),
('https://sammlung.staedelmuseum.de/images/2208/jan-van-goyen-zugeschrieben-dirt-road-farmhouse-and-board-fe-2225--thumb-lg.jpg', 'Dirt Road with Farmhouse and Board Fence', 'drawing', 'Born in 1907 into a wealthy, liberal family in Berlin, Karin Hissink became an important ethnologist during the 1930s. She was, among other things, director of the Frobenius Institute in Frankfurt during the Second World War and maintained close ties with it for the rest of her life. She left her private and her scientific estate to the institute. She shared her interest in art with her husband, AIbert Hahn, who also accompanied her on her research trips to South America. Karin Hahn-Hissink bequeathed her art collection to the Stadelscher Museums-Verein.', 'Jan van Goyen', '1629', 'paper', 'drawn', '48 x 70.2 cm', 2, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `total_work`
--

CREATE TABLE `total_work` (
  `category_ID` int(11) NOT NULL,
  `category` mediumtext NOT NULL,
  `work_ID` int(11) NOT NULL,
  `title` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `total_work`
--

INSERT INTO `total_work` (`category_ID`, `category`, `work_ID`, `title`) VALUES
(1, 'renaissance', 1, 'The Adoration of the Magi'),
(1, 'renaissance', 2, 'The Angel of the Annunciation'),
(1, 'renaissance', 3, 'Brothel Scene'),
(1, 'renaissance', 4, 'Cephalus Grieves for Procris'),
(1, 'renaissance', 5, 'Christ Blessing the Children'),
(1, 'renaissance', 6, 'Madonna and Child with Saints John the Baptist and Elizabeth'),
(1, 'renaissance', 7, 'Double Portrait of Justinian von Holzhausen and His Wife Anna, nee Furstenberg'),
(1, 'renaissance', 8, 'Ecce Homo'),
(1, 'renaissance', 9, 'Exterior Wings of the Frankfurt Dominican Altarpiece'),
(1, 'renaissance', 10, 'Female Martyr with Angels (Saint Catherine of Alexandria?)'),
(1, 'renaissance', 11, 'Four Naked Women (The Four Witches)'),
(1, 'renaissance', 12, 'The Madonna, the Infant St. John and the Angel, Worshipping the Christ Child'),
(1, 'renaissance', 13, 'The Holy Family'),
(1, 'renaissance', 14, 'High Altar of the Dominican Church in Frankfurt'),
(1, 'renaissance', 15, 'The Holy Family with the Dragonfly'),
(1, 'renaissance', 16, 'The Holy Kinship'),
(1, 'renaissance', 17, 'The Holy Kinship (so-called \"Torgau Altarpiece\")'),
(1, 'renaissance', 18, 'Idealised Portrait of a Lady (Portrait of Simonetta Vespucci as Nymph)'),
(1, 'renaissance', 19, 'Job on the Dungheap'),
(1, 'renaissance', 20, 'Madonna and Child with the Infant St. John'),
(2, 'romance', 1, 'The Adoration of the Golden Calf'),
(2, 'romance', 2, 'The Adoration of the Shepherds'),
(2, 'romance', 3, 'Breakfast'),
(2, 'romance', 4, 'In the Cafe d\'Harcourt in Paris'),
(2, 'romance', 5, 'Allegory of the Arts'),
(2, 'romance', 6, 'Alpine Landscape with Beck'),
(2, 'romance', 7, 'Alpine Landscape at Sunset'),
(2, 'romance', 8, 'Arabs Resting by a Marble Fountain'),
(2, 'romance', 9, 'The Artist\'s Studio'),
(2, 'romance', 10, 'The Arts Being Introduced to Germany by Christianity'),
(2, 'romance', 11, 'Ball Game in Rome'),
(2, 'romance', 12, 'The Birth and Naming of St John the Baptist'),
(2, 'romance', 13, 'The Bitter Potion'),
(2, 'romance', 14, 'The Blinding of Samson'),
(2, 'romance', 15, 'The Adoration of the Shepherds'),
(2, 'romance', 16, 'After the Luncheon'),
(2, 'romance', 17, 'Capuchin Sermon at the Colosseum of Rome'),
(2, 'romance', 18, 'The Continence of Scipio'),
(2, 'romance', 19, 'The Courtyard of the Orphanage in Amsterdam: Free Period in the Amsterdam Orphanage'),
(2, 'romance', 20, 'Dirt Road with Farmhouse and Board Fence'),
(3, 'modern', 1, 'Abstract Head: Symphony in Pink'),
(3, 'modern', 2, 'Adam and Eve'),
(3, 'modern', 3, 'Achrome'),
(3, 'modern', 4, 'Adam and Eve'),
(3, 'modern', 5, 'alea jacta'),
(3, 'modern', 6, 'Aquis submersus'),
(3, 'modern', 7, 'Ascona'),
(3, 'modern', 8, 'Astrale Komposition VI'),
(3, 'modern', 9, 'The Avenue in Saint-Cloud Park'),
(3, 'modern', 10, 'Backstage'),
(3, 'modern', 11, 'Barrier'),
(3, 'modern', 12, 'The Bathers'),
(3, 'modern', 13, 'Adam and Eve'),
(3, 'modern', 14, 'Bauhaus Stairway'),
(3, 'modern', 15, 'Bank of the Main and Church'),
(3, 'modern', 16, 'Berlin Street Scene'),
(3, 'modern', 17, 'Blick auf Krollwitz'),
(3, 'modern', 18, 'Blue Triangle'),
(3, 'modern', 19, 'BMC-7'),
(3, 'modern', 20, 'Brick negro'),
(4, 'medieval', 1, 'The Agony in the Garden'),
(4, 'medieval', 2, 'The Bad Thief to the Left of Christ; former exterior wing of the triptych: Saint John the Baptist'),
(4, 'medieval', 3, 'The Blinding of St Victor'),
(4, 'medieval', 4, 'The Coronation of the Virgin, reverse: Christ Carrying the Cross'),
(4, 'medieval', 5, 'The Crucifixion'),
(4, 'medieval', 6, 'Crucifixion, Virgin and Child, Deacon and Scenes from the Legends of Saints Matthew and John the Evangelist'),
(4, 'medieval', 7, 'The Flemalle Panels: St. Veronica with the Veil, Madonna Breastfeeding, The Trinity'),
(4, 'medieval', 8, 'The Little Garden of Paradise'),
(4, 'medieval', 9, 'Lucca Madonna'),
(4, 'medieval', 10, 'Madonna and Child'),
(4, 'medieval', 11, 'Madonna and Child Enthroned and Twelve Angels'),
(4, 'medieval', 12, 'Medici Madonna'),
(4, 'medieval', 13, 'Saint Barbara'),
(4, 'medieval', 14, 'Seven Scenes from the Legend of St. Stephen'),
(4, 'medieval', 15, 'St John the Evangelist Mourning'),
(4, 'medieval', 16, 'St Mark the Evangelist'),
(4, 'medieval', 17, 'Two altarpiece wings with the Martyrdom of the Apostles'),
(4, 'medieval', 18, 'Virgin and Child Enthroned with Angels Making Music'),
(4, 'medieval', 19, 'Virgin and Child with Saints Jerome and Francis'),
(4, 'medieval', 20, 'The Wings of the Altenberg Altarpiece');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`user_ID`, `name`, `account`, `password`) VALUES
(1, 'amber', 'amberwu0411@gmail.com', '6fc99bebd29285757ca76a182644f35fe564a2b76e9fef3151cc95c169e2572c'),
(2, 'wingting', 'wingting013@gmail.com', '8970515170de4f7736b75cb3edefda8747529c9c5682219ef19354d4db339826'),
(3, 'paper', 'ppr921@gmail.com', 'a6744c61df46a6900e1b70432a734cab6f5fc7421ac3591719cd17d4c0d815ee');

-- --------------------------------------------------------

--
-- 資料表結構 `user_collection`
--

CREATE TABLE `user_collection` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `category_ID` int(11) NOT NULL,
  `work_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `user_collection`
--

INSERT INTO `user_collection` (`ID`, `user_ID`, `category_ID`, `work_ID`) VALUES
(14, 2, 4, 7),
(21, 1, 3, 5),
(24, 1, 3, 20),
(31, 1, 3, 17),
(32, 1, 1, 5),
(48, 3, 3, 3),
(49, 2, 1, 6),
(50, 1, 2, 9),
(51, 1, 3, 12),
(52, 2, 2, 14),
(53, 3, 1, 18),
(54, 3, 2, 17),
(56, 2, 3, 19);

-- --------------------------------------------------------

--
-- 資料表結構 `user_comment`
--

CREATE TABLE `user_comment` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `category_ID` int(11) NOT NULL,
  `work_ID` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `user_comment`
--

INSERT INTO `user_comment` (`ID`, `user_ID`, `category_ID`, `work_ID`, `comment`) VALUES
(1, 1, 1, 5, 'The painting features vivid colors and bold composition, creating a strong visual impact. The play of light and shadow adds depth to the artwork. Its modern style and emotional depth leave a lasting impression.'),
(2, 2, 2, 10, 'The painting\'s vivid colors and bold composition evoke strong emotions, leaving a lasting impression and inviting reflection.'),
(3, 3, 3, 15, 'The artwork captures attention with its striking use of color and intricate details. The composition flows smoothly, guiding the viewer’s eye across the canvas. It evokes a sense of tranquility, yet the contrasting elements add complexity, inviting deeper reflection.\n\n\n\n'),
(4, 1, 3, 17, 'I like this work.'),
(5, 1, 3, 20, 'Like it. The man looks so angry.'),
(6, 1, 3, 5, 'Don\'t understand what the artist wants to say, but ... I like it!'),
(7, 3, 3, 19, 'It consists of fragments of several pictures that Frank Nitsche has taken from newspapers and magazines and painted together in such a way that a new form emerges that does not allow any conclusions to be drawn about the origin of the parts.'),
(8, 3, 3, 1, 'Dot, dot, comma, dash... So many Dots....'),
(9, 3, 2, 2, 'People in this image must be worthy persons from among the local citizenry.'),
(10, 3, 1, 3, 'His oeuvre consists of small-format biblical scenes containing numerous figures and of works showing \"loose society\" with a sociocritical element or critical of the Church.'),
(11, 3, 3, 3, 'I am paper, and paper is also white! Just like this work.'),
(12, 2, 3, 19, 'Hey! I also like it! No wonder we are good friends [^] _ [^]'),
(14, 2, 2, 14, 'WOW!! I like it!'),
(15, 1, 1, 4, 'What a beautiful art work! I like it so much');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `medieval`
--
ALTER TABLE `medieval`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `modern`
--
ALTER TABLE `modern`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `renaissance`
--
ALTER TABLE `renaissance`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `romance`
--
ALTER TABLE `romance`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `total_work`
--
ALTER TABLE `total_work`
  ADD PRIMARY KEY (`category_ID`,`work_ID`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`);

--
-- 資料表索引 `user_collection`
--
ALTER TABLE `user_collection`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `medieval`
--
ALTER TABLE `medieval`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `modern`
--
ALTER TABLE `modern`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `renaissance`
--
ALTER TABLE `renaissance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `romance`
--
ALTER TABLE `romance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_collection`
--
ALTER TABLE `user_collection`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_comment`
--
ALTER TABLE `user_comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
