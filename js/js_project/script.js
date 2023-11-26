// ================== map  ========================
let map, directionsService, directionsRenderer
let sourceAutocomplete, desAutocomplete

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 28.10869437531747, lng: 30.75207774654349 },
        zoom: 13
    })
    google.maps.event.addListener(map, "click", function (event) {
        this.setOptions({ scrollwheel: true })
    })
    directionsService = new google.maps.DirectionsService()
    directionsRenderer = new google.maps.DirectionsRenderer()
    directionsRenderer.setMap(map)

    var source = "ITI - Information Technology Institute (AlMinya), Damaris, Minya, Egypt"
    var dest = "Horus Resort Menia, Kornish Al Nile, الكورنيش، Minya, Egypt"

    let request = {
        origin: source,
        destination: dest,
        travelMode: 'DRIVING'
    }
    directionsService.route(request, function (result, status) {
        if (status == 'OK') {
            directionsRenderer.setDirections(result)
        }
    })
}



// ===================== fetch data from firebae ==========================
let pagesArr = [];
fetch('https://plantsecommerce-65528-default-rtdb.firebaseio.com/pages.json')
    .then((response) => {
        return response.json();
    })
    .then(
        (data) => {
            data.forEach(element => {

                pagesArr.push(element);
            });
            console.log(pagesArr);

        });

// fetch('https://plantsecommerce-65528-default-rtdb.firebaseio.com/pages.json', {
//     method: "PUT",
//     body: JSON.stringify(
        // [
        //     {
        //         "id": 1,
        //         "name": "Abies alba",
        //         "price": 15,
        //         "rate": 1,
        //         "description": "Abies alba is a large evergreen coniferous tree growing to 40–50 m ",
        //         "category": {
        //             "name": "",
        //             "type": "home",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://media.licdn.com/dms/image/C4D12AQFbl47XJyqhdA/article-cover_image-shrink_720_1280/0/1522179197413?e=2147483647&v=beta&t=I1NYupz3xZP3y-bGCj9cELcXGy3XTQTDzQIZasQOYAQ"
        //     },
        //     {
        //         "id": 2,
        //         "name": "Abies amabilis",
        //         "price": 16,
        //         "rate": 2,
        //         "description": "The tree is a large evergreen conifer growing to 30–45 metres (98–148 feet)",
        //         "category": {
        //             "name": "Abies amabilis",
        //             "type": "work",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLuXog_qaYzrSS_l35JMhnbIy2A6qUVQ8IGX0ETswHthCBI3OV"
        //     },
        //     {
        //         "id": 3,
        //         "name": "Abies balsamea",
        //         "price": 17,
        //         "rate": 3,
        //         "description": "Balsam fir is a small to medium-size evergreen tree typically 14–20 metres (46–66 ft) tall",
        //         "category": {
        //             "name": "Abies balsamea",
        //             "type": "gardenHome",
        //             "class": "Abies balsamea"
        //         },
        //         "img": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ4poKPHrgZsqSZ08pXJ4agtQohw16E2CGBaRPJgA5w4fhZRIAo"
        //     },
        //     {
        //         "id": 4,
        //         "name": "Abies borisii-regis",
        //         "price": 18,
        //         "rate": 4,
        //         "description": "It is a large evergreen coniferous tree growing to 40–50 m",
        //         "category": {
        //             "name": "Abies borisii-regis",
        //             "type": "GardenWork",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRzqDZcEp65mW4OmdLtWEsiuqVy6xaVZaSkL8TqQXyO6xgmF5jZ"
        //     },
        //     {
        //         "id": 5,
        //         "name": "Abies cephalonica",
        //         "price": 19,
        //         "rate": 5,
        //         "description": "They are 2-3 cm long, needle -like, prickly and bright green on the upper face",
        //         "category": {
        //             "name": "Abies cephalonica",
        //             "type": "forest",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://m.media-amazon.com/images/I/61co9y0a-eL.jpg"
        //     },
        //     {
        //         "id": 6,
        //         "name": "Abies concolor",
        //         "price": 20,
        //         "rate": 1,
        //         "description": "This large evergreen conifer grows best in the central Sierra Nevada of California",
        //         "category": {
        //             "name": "Abies concolor",
        //             "type": "lab",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://wildlifeinformer.com/wp-content/uploads/2022/07/Birds.jpg"
        //     },
        //     {
        //         "id": 7,
        //         "name": "Abies nordmanniana",
        //         "price": 21,
        //         "rate": 2,
        //         "description": "It is a large evergreen coniferous tree growing to 55–61 m tall and with a trunk diameter of up to 2 m",
        //         "category": {
        //             "name": "Abies nordmanniana",
        //             "type": "medical",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://m.media-amazon.com/images/I/714mfD+S1XL.jpg"
        //     },
        //     {
        //         "id": 8,
        //         "name": "Abies fabri",
        //         "price": 22,
        //         "rate": 3,
        //         "description": "the family Pinaceae. It is endemic to Sichuan in western China",
        //         "category": {
        //             "name": "Abies fabri",
        //             "type": "poison",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://s1.best-wallpaper.net/wallpaper/m/1708/Forget-me-not-blue-flower-close-up-water-drops_m.webp"
        //     },
        //     {
        //         "id": 9,
        //         "name": "Abies fargesii",
        //         "price": 23,
        //         "rate": 4,
        //         "description": "Its common name is Farges' fir, after the French missionary",
        //         "category": {
        //             "name": "Abies fargesii",
        //             "type": "home",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1656449959.jpg?crop=1xw:1xh;center,top&resize=980:*"
        //     },
        //     {
        //         "id": 10,
        //         "name": "Abies firma",
        //         "price": 24,
        //         "rate": 1,
        //         "description": "Abies firma is a medium-sized to large evergreen coniferous tree growing to 50 metres",
        //         "category": {
        //             "name": "Abies firma",
        //             "type": "home",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/close-up-of-pink-roses-royalty-free-image-1585426475.jpg?crop=0.502xw:1.00xh;0.498xw,0&resize=980:*"
        //     },
        //     {
        //         "id": 11,
        //         "name": "Abies forrestii",
        //         "price": 25,
        //         "rate": 2,
        //         "description": "This species is variable in morphology, and there are several varieties. Some of these are treated as separate species.[1] In general, it grows up to about 20 meters tall",
        //         "category": {
        //             "name": "Abies forrestii",
        //             "type": "work",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/decorative-dwarf-pine-grows-in-the-garden-royalty-free-image-1585426852.jpg?crop=0.891xw:1.00xh;0.109xw,0&resize=980:*"
        //     },
        //     {
        //         "id": 12,
        //         "name": "Fraser fir",
        //         "price": 26,
        //         "rate": 3,
        //         "description": "Abies fraseri is a small evergreen coniferous tree typically growing between 10 and 15 m (30 and 50 ft) tall",
        //         "category": {
        //             "name": "Fraser fir",
        //             "type": "gardenHome",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/japanese-maple-at-westonbirt-arboretum-royalty-free-image-1585426981.jpg?crop=0.44455xw:1xh;center,top&resize=980:*"
        //     },
        //     {
        //         "id": 13,
        //         "name": "Abies grandis",
        //         "price": 27,
        //         "rate": 4,
        //         "description": "Abies grandis is a large evergreen conifer growing to 40–70 metres (130–230 feet) tall, exceptionally 100 m (330 ft)",
        //         "category": {
        //             "name": "Abies grandis",
        //             "type": "GardenWork",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/close-up-image-of-the-beautiful-summer-flowering-royalty-free-image-1585427236.jpg?crop=0.447xw:1.00xh;0.223xw,0&resize=980:*"
        //     },
        //     {
        //         "id": 14,
        //         "name": "Abies holophylla",
        //         "price": 28,
        //         "rate": 5,
        //         "description": "Abies holophylla, also called needle fir[2] or Manchurian fir, is a species of fir native to mountainous regions of northern Korea, southern Ussuriland, and China in the provinces of Heilongjiang, Jilin, and Liaoning.",
        //         "category": {
        //             "name": "Abies holophylla",
        //             "type": "forest",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/creeping-jenny-lysimachia-aura-trailing-plant-royalty-free-image-527889280-1555432043.jpg?crop=0.44623xw:1xh;center,top&resize=980:*"
        //     },
        //     {
        //         "id": 15,
        //         "name": "Abies homolepis",
        //         "price": 29,
        //         "rate": 1,
        //         "description": "Abies homolepis, the Nikko fir[2] (in Japanese, urajiro-momi), is a fir native to the mountains of central and southern Honshū and Shikoku, Japan.",
        //         "category": {
        //             "name": "Abies homolepis",
        //             "type": "lab",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/hosta-moon-river-news-photo-1631627410.jpg?crop=0.44444xw:1xh;center,top&resize=980:*"
        //     },
        //     {
        //         "id": 16,
        //         "name": "Abies koreana",
        //         "price": 30,
        //         "rate": 2,
        //         "description": "It is a small to medium-sized evergreen coniferous tree growing to 10–18 m (33–59 ft) tall with a trunk diameter of up to 0.7 m (2 ft 4 in), smaller and sometimes shrubby at the tree line. ",
        //         "category": {
        //             "name": "Abies koreana",
        //             "type": "medical",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.shopify.com/s/files/1/0489/5922/6015/files/8_4c66d3bf-6ba4-4ddb-88a5-9cfa22009271_480x480.jpg?v=1667217568"
        //     },
        //     {
        //         "id": 17,
        //         "name": "Abies lasiocarpa",
        //         "price": 31,
        //         "rate": 3,
        //         "description": "Abies lasiocarpa is a medium-sized evergreen conifer with a very narrow conic crown, growing to 20 metres (66 ft) tall, exceptionally 40–50 m (130–160 ft)",
        //         "category": {
        //             "name": "Abies lasiocarpa",
        //             "type": "poison",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.shopify.com/s/files/1/0489/5922/6015/files/7_7ae5c923-708d-494c-824e-f4380f12661f_480x480.jpg?v=1667217544"
        //     },
        //     {
        //         "id": 18,
        //         "name": "Abies magnifica",
        //         "price": 32,
        //         "rate": 4,
        //         "description": "Abies magnifica is a large evergreen tree typically up to 40–60 metres (130–200 ft) tall and 2 m (6 ft 7 in) trunk diameter, rarely to 76.5 m (251 ft) tall and 3 m (9 ft 10 in) diameter",
        //         "category": {
        //             "name": "Abies magnifica",
        //             "type": "home",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.shopify.com/s/files/1/0489/5922/6015/files/5_3fdde368-beff-4c8a-8142-cf82a0b565c9_480x480.jpg?v=1667217416"
        //     },
        //     {
        //         "id": 19,
        //         "name": "Abies mariesii",
        //         "price": 33,
        //         "rate": 5,
        //         "description": " in Japanese,Ōshirabiso, or Aomoritodomatsu) is a fir native to the mountains of central and northern Honshū, Japan",
        //         "category": {
        //             "name": "Abies mariesii",
        //             "type": "work",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/16/118616-050-75E38257/Houseleek.jpg"
        //     },
        //     {
        //         "id": 20,
        //         "name": "Abies nebrodensis",
        //         "price": 34,
        //         "rate": 1,
        //         "description": "It is a medium-size evergreen coniferous tree growing to 15–25 m tall and with a trunk diameter of up to 1 m.[1]The leaves are needle-like",
        //         "category": {
        //             "name": "Abies nebrodensis",
        //             "type": "gardenHome",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/31/100631-050-F219B9CB/Prickly-pear-cactus-Arizona.jpg"
        //     },
        //     {
        //         "id": 21,
        //         "name": "Abies nephrolepis",
        //         "price": 35,
        //         "rate": 2,
        //         "description": "Abies nephrolepis, commonly known as Khingan fir,[4] is a species of fir native to northeastern China (Hebei, Heilongjiang, Jilin, Liaoning, Shaanxi)",
        //         "category": {
        //             "name": "Abies nephrolepis",
        //             "type": "GardenWork",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/57/5657-050-289A33D6/Echeveria-leaves-waxes.jpg"
        //     },
        //     {
        //         "id": 22,
        //         "name": "Abies nordmanniana",
        //         "price": 36,
        //         "rate": 3,
        //         "description": "It is a large evergreen coniferous tree growing to 55–61 m tall and with a trunk diameter of up to 2 m. In the Western Caucasus Reserve",
        //         "category": {
        //             "name": "Abies nordmanniana",
        //             "type": "forest",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/18/127018-050-913FB234/Caribbean-agave.jpg"
        //     },
        //     {
        //         "id": 23,
        //         "name": "Abies numidica",
        //         "price": 37,
        //         "rate": 4,
        //         "description": "Abies numidica is a medium-sized to large evergreen tree growing to 20–35 meters tall, with a trunk up to 1 meter diameter. ",
        //         "category": {
        //             "name": "Abies numidica",
        //             "type": "lab",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/20/13520-050-6FC47BDC/Aloe-saponaria.jpg"
        //     },
        //     {
        //         "id": 24,
        //         "name": "Abies pindrow",
        //         "price": 38,
        //         "rate": 5,
        //         "description": "It is a large evergreen tree growing to 40–60 metres (130–200 ft) tall, and with a trunk diameter of up to 2–2.5 metres",
        //         "category": {
        //             "name": "Abies pindrow",
        //             "type": "medical",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/20/13520-050-6FC47BDC/Aloe-saponaria.jpg"
        //     },
        //     {
        //         "id": 25,
        //         "name": "Abies pinsapo",
        //         "price": 39,
        //         "rate": 1,
        //         "description": "Abies pinsapo is an evergreen conifer growing to 20–30 m tall, with a conic crown, sometimes becoming irregular with age",
        //         "category": {
        //             "name": "Abies pinsapo",
        //             "type": "poison",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/14/120814-004-303B87AA/stonecrop.jpg"
        //     },
        //     {
        //         "id": 26,
        //         "name": "Abies procera",
        //         "price": 40,
        //         "rate": 2,
        //         "description": "A. procera is a large evergreen conifer with a narrow conic crown, growing up to 70 meters (230 ft) tall and 2 m (6 ft 7 in) in trunk diameter",
        //         "category": {
        //             "name": "Abies procera",
        //             "type": "home",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://cdn.britannica.com/69/1869-050-198F0B36/Varieties-Calypso-Bonanza-Garnet.jpg"
        //     },
        //     {
        //         "id": 27,
        //         "name": "Abies recurvata",
        //         "price": 41,
        //         "rate": 3,
        //         "description": "Abies recurvata is a species of conifer in the family Pinaceae. It is found only in China.",
        //         "category": {
        //             "name": "Abies recurvata",
        //             "type": "work",
        //             "class": "Pinopsidac"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg"
        //     },
        //     {
        //         "id": 28,
        //         "name": "Abies sachalinensis",
        //         "price": 42,
        //         "rate": 4,
        //         "description": "Grows to 30m tall with Girths up to 100 cm. The crown pyramidal, but tend to flatten out as they grow to old age.",
        //         "category": {
        //             "name": "Abies sachalinensis",
        //             "type": "gardenHome",
        //             "class": "cPinopsida"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/echinacea-purpurea-coneflower-pixabay_11895.jpg"
        //     },
        //     {
        //         "id": 29,
        //         "name": "Abies sibirica",
        //         "price": 43,
        //         "rate": 5,
        //         "description": "The tree lives in the cold boreal climate on moist soils in mountains or river basins at elevations of 1900–2400 m. It is very shade-tolerant",
        //         "category": {
        //             "name": "Abies sibirica",
        //             "type": "GardenWork",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/marigold-light-orange-flower-pixabay_11875.jpg"
        //     },
        //     {
        //         "id": 30,
        //         "name": "Abies veitchii",
        //         "price": 44,
        //         "rate": 1,
        //         "description": "Abies veitchii var. veitchii. Endemic to Honshū; Shoots densely pubescent. Leaves 1.5–3 cm long; stomatal bands bluish white.",
        //         "category": {
        //             "name": "Abies veitchii",
        //             "type": "forest",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/pansies-purple-flower-viola-pixabay_11872.jpg"
        //     },
        //     {
        //         "id": 31,
        //         "name": "Abies spectabilis",
        //         "price": 45,
        //         "rate": 2,
        //         "description": "Abies spectabilis, the East Himalayan fir, is a conifer species in the family Pinaceae and the genus Abies.",
        //         "category": {
        //             "name": "Abies spectabilis",
        //             "type": "lab",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/snapdragons-pink-flower-antirrhinum-pixabay_11869.jpg"
        //     },
        //     {
        //         "id": 32,
        //         "name": "Abies fargesii",
        //         "price": 46,
        //         "rate": 3,
        //         "description": "Abies fargesii Chinese is a species of fir, a coniferous tree in the family Pinaceae",
        //         "category": {
        //             "name": "Abies fargesii",
        //             "type": "medical",
        //             "class": "Pinopsida"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/be-my-heart-calla-lily-zantedeschia-hybrid-proven-winners_16787.jpg"
        //     },
        //     {
        //         "id": 33,
        //         "name": "Acidosasa",
        //         "price": 47,
        //         "rate": 4,
        //         "description": "Grow in south coastal China, and have sour shoots.",
        //         "category": {
        //             "name": "Acidosasa",
        //             "type": "poison",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/morgana-red-garden-mum-red-chrysanthemum-proven-winners_17040.jpg"
        //     },
        //     {
        //         "id": 34,
        //         "name": "Acidosasa chienouensis",
        //         "price": 48,
        //         "rate": 5,
        //         "description": "Green glabrous culms, sheath turns brown, from green. The roots are often eaten, and are said to be delicious.",
        //         "category": {
        //             "name": "Acidosasa chienouensis",
        //             "type": "home",
        //             "class": "c"
        //         },
        //         "img": "../imgMostafa/flours/  (33).jpghttps://www.gardendesign.com/pictures/images/675x529Max/site_3/ruby-spider-daylily-red-daylily-hemerocallis-hybrid-proven-winners_15046.jpg"
        //     },
        //     {
        //         "id": 35,
        //         "name": "Acidosasa edulis",
        //         "price": 49,
        //         "rate": 1,
        //         "description": "Green glabrous culms, sheath turns brown, from green. The roots are often eaten, and are said to be delicious.",
        //         "category": {
        //             "name": "Acidosasa edulis",
        //             "type": "work",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/fruit-punch-cherry-vanilla-dianthus-pinks-dianthus-proven-winners_13619.jpg"
        //     },
        //     {
        //         "id": 36,
        //         "name": "Actinocladum",
        //         "price": 50,
        //         "rate": 2,
        //         "description": "A one-member genus distributed in western South America and Brazil.",
        //         "category": {
        //             "name": "Actinocladum",
        //             "type": "gardenHome",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/kobold-liatris-liatris-spicata-walters-gardens_15079.jpg"
        //     },
        //     {
        //         "id": 37,
        //         "name": "Ampelocalamus",
        //         "price": 51,
        //         "rate": 3,
        //         "description": "Hangs loosely, or is scrambling. Nodes are slightly swollen. Nearly equal branches, central branches usually smaller than culms.",
        //         "category": {
        //             "name": "Ampelocalamus",
        //             "type": "GardenWork",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/daisy-may-shasta-daisy-proven-winners_13673.jpg"
        //     },
        //     {
        //         "id": 38,
        //         "name": "Apoclada",
        //         "price": 52,
        //         "rate": 4,
        //         "description": "A one-member genus found in the forests of southeastern Brazil.",
        //         "category": {
        //             "name": "Apoclada",
        //             "type": "forest",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/tulip-orange-flower-garden-design_10130.jpg"
        //     },
        //     {
        //         "id": 39,
        //         "name": "Arthrostylidium",
        //         "price": 53,
        //         "rate": 5,
        //         "description": "climbing bamboos found in the New World.",
        //         "category": {
        //             "name": "Arthrostylidium",
        //             "type": "lab",
        //             "class": "c"
        //         },
        //         "img": "https://hips.hearstapps.com/hmg-prod/images/creeping-jenny-lysimachia-aura-trailing-plant-royalty-free-image-527889280-1555432043.jpg?crop=0.44623xw:1xh;center,top&resize=980:*"
        //     },
        //     {
        //         "id": 40,
        //         "name": "Bacopa monnieri",
        //         "price": 54,
        //         "rate": 1,
        //         "description": "Bacopa monnieri is a non-aromatic herb. The leaves of this plant are succulent, oblong, and 4–6 mm (0.16–0.24 in) thick",
        //         "category": {
        //             "name": "Bacopa monnieri",
        //             "type": "medical",
        //             "class": "c"
        //         },
        //         "img": "https://www.gardendesign.com/pictures/images/675x529Max/site_3/snapdragons-pink-flower-antirrhinum-pixabay_11869.jpg"
        //     }
        // ]
//     )
// })
//     .then(res => res.json())
//     .then((dat) => console.log(dat));