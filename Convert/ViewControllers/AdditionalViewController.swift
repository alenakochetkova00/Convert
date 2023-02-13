import UIKit


// MARK: - View View Controller (working with api)
class AdditionalViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listCurrencyCountries = [String : Double]()
    let listCodeCountries = ["BD": "BDT", "BE": "EUR", "BF": "XOF", "BG": "BGN", "BA": "BAM", "BB": "BBD", "WF": "XPF", "BL": "EUR", "BM": "BMD", "BN": "BND", "BO": "BOB", "BH": "BHD", "BI": "BIF", "BJ": "XOF", "BT": "BTN", "JM": "JMD", "BV": "NOK", "BW": "BWP", "WS": "WST", "BQ": "USD", "BR": "BRL", "BS": "BSD", "JE": "GBP", "BY": "BYR", "BZ": "BZD", "RU": "RUB", "RW": "RWF", "RS": "RSD", "TL": "USD", "RE": "EUR", "TM": "TMT", "TJ": "TJS", "RO": "RON", "TK": "NZD", "GW": "XOF", "GU": "USD", "GT": "GTQ", "GS": "GBP", "GR": "EUR", "GQ": "XAF", "GP": "EUR", "JP": "JPY", "GY": "GYD", "GG": "GBP", "GF": "EUR", "GE": "GEL", "GD": "XCD", "GB": "GBP", "GA": "XAF", "SV": "USD", "GN": "GNF", "GM": "GMD", "GL": "DKK", "GI": "GIP", "GH": "GHS", "OM": "OMR", "TN": "TND", "JO": "JOD", "HR": "HRK", "HT": "HTG", "HU": "HUF", "HK": "HKD", "HN": "HNL", "HM": "AUD", "VE": "VEF", "PR": "USD", "PS": "ILS", "PW": "USD", "PT": "EUR", "SJ": "NOK", "PY": "PYG", "IQ": "IQD", "PA": "PAB", "PF": "XPF", "PG": "PGK", "PE": "PEN", "PK": "PKR", "PH": "PHP", "PN": "NZD", "PL": "PLN", "PM": "EUR", "ZM": "ZMK", "EH": "MAD", "EE": "EUR", "EG": "EGP", "ZA": "ZAR", "EC": "USD", "IT": "EUR", "VN": "VND", "SB": "SBD", "ET": "ETB", "SO": "SOS", "ZW": "ZWL", "SA": "SAR", "ES": "EUR", "ER": "ERN", "ME": "EUR", "MD": "MDL", "MG": "MGA", "MF": "EUR", "MA": "MAD", "MC": "EUR", "UZ": "UZS", "MM": "MMK", "ML": "XOF", "MO": "MOP", "MN": "MNT", "MH": "USD", "MK": "MKD", "MU": "MUR", "MT": "EUR", "MW": "MWK", "MV": "MVR", "MQ": "EUR", "MP": "USD", "MS": "XCD", "MR": "MRO", "IM": "GBP", "UG": "UGX", "TZ": "TZS", "MY": "MYR", "MX": "MXN", "IL": "ILS", "FR": "EUR", "IO": "USD", "SH": "SHP", "FI": "EUR", "FJ": "FJD", "FK": "FKP", "FM": "USD", "FO": "DKK", "NI": "NIO", "NL": "EUR", "NO": "NOK", "NA": "NAD", "VU": "VUV", "NC": "XPF", "NE": "XOF", "NF": "AUD", "NG": "NGN", "NZ": "NZD", "NP": "NPR", "NR": "AUD", "NU": "NZD", "CK": "NZD", "XK": "EUR", "CI": "XOF", "CH": "CHF", "CO": "COP", "CN": "CNY", "CM": "XAF", "CL": "CLP", "CC": "AUD", "CA": "CAD", "CG": "XAF", "CF": "XAF", "CD": "CDF", "CZ": "CZK", "CY": "EUR", "CX": "AUD", "CR": "CRC", "CW": "ANG", "CV": "CVE", "CU": "CUP", "SZ": "SZL", "SY": "SYP", "SX": "ANG", "KG": "KGS", "KE": "KES", "SS": "SSP", "SR": "SRD", "KI": "AUD", "KH": "KHR", "KN": "XCD", "KM": "KMF", "ST": "STD", "SK": "EUR", "KR": "KRW", "SI": "EUR", "KP": "KPW", "KW": "KWD", "SN": "XOF", "SM": "EUR", "SL": "SLL", "SC": "SCR", "KZ": "KZT", "KY": "KYD", "SG": "SGD", "SE": "SEK", "SD": "SDG", "DO": "DOP", "DM": "XCD", "DJ": "DJF", "DK": "DKK", "VG": "USD", "DE": "EUR", "YE": "YER", "DZ": "DZD", "US": "USD", "UY": "UYU", "YT": "EUR", "UM": "USD", "LB": "LBP", "LC": "XCD", "LA": "LAK", "TV": "AUD", "TW": "TWD", "TT": "TTD", "TR": "TRY", "LK": "LKR", "LI": "CHF", "LV": "EUR", "TO": "TOP", "LT": "LTL", "LU": "EUR", "LR": "LRD", "LS": "LSL", "TH": "THB", "TF": "EUR", "TG": "XOF", "TD": "XAF", "TC": "USD", "LY": "LYD", "VA": "EUR", "VC": "XCD", "AE": "AED", "AD": "EUR", "AG": "XCD", "AF": "AFN", "AI": "XCD", "VI": "USD", "IS": "ISK", "IR": "IRR", "AM": "AMD", "AL": "ALL", "AO": "AOA", "AQ": "", "AS": "USD", "AR": "ARS", "AU": "AUD", "AT": "EUR", "AW": "AWG", "IN": "INR", "AX": "EUR", "AZ": "AZN", "IE": "EUR", "ID": "IDR", "UA": "UAH", "QA": "QAR", "MZ": "MZN"]
    
    let listNamesCountries = ["AC": "Ascension Island",
                                    "AD": "Andorra",
                                    "AE": "United Arab Emirates",
                                    "AF": "Afghanistan",
                                    "AG": "Antigua & Barbuda",
                                    "AI": "Anguilla",
                                    "AL": "Albania",
                                    "AM": "Armenia",
                                    "AO": "Angola",
                                    "AQ": "Antarctica",
                                    "AR": "Argentina",
                                    "AS": "American Samoa",
                                    "AT": "Austria",
                                    "AU": "Australia",
                                    "AW": "Aruba",
                                    "AX": "Åland Islands",
                                    "AZ": "Azerbaijan",
                                    "BA": "Bosnia & Herzegovina",
                                    "BB": "Barbados",
                                    "BD": "Bangladesh",
                                    "BE": "Belgium",
                                    "BF": "Burkina Faso",
                                    "BG": "Bulgaria",
                                    "BH": "Bahrain",
                                    "BI": "Burundi",
                                    "BJ": "Benin",
                                    "BL": "St. Barthélemy",
                                    "BM": "Bermuda",
                                    "BN": "Brunei",
                                    "BO": "Bolivia",
                                    "BQ": "Caribbean Netherlands",
                                    "BR": "Brazil",
                                    "BS": "Bahamas",
                                    "BT": "Bhutan",
                                    "BV": "Bouvet Island",
                                    "BW": "Botswana",
                                    "BY": "Belarus",
                                    "BZ": "Belize",
                                    "CA": "Canada",
                                    "CC": "Cocos (Keeling) Islands",
                                    "CD": "Congo - Kinshasa",
                                    "CF": "Central African Republic",
                                    "CG": "Congo - Brazzaville",
                                    "CH": "Switzerland",
                                    "CI": "Côte d’Ivoire",
                                    "CK": "Cook Islands",
                                    "CL": "Chile",
                                    "CM": "Cameroon",
                                    "CN": "China",
                                    "CO": "Colombia",
                                    "CP": "Clipperton Island",
                                    "CR": "Costa Rica",
                                    "CU": "Cuba",
                                    "CV": "Cape Verde",
                                    "CW": "Curaçao",
                                    "CX": "Christmas Island",
                                    "CY": "Cyprus",
                                    "CZ": "Czechia",
                                    "DE": "Germany",
                                    "DG": "Diego Garcia",
                                    "DJ": "Djibouti",
                                    "DK": "Denmark",
                                    "DM": "Dominica",
                                    "DO": "Dominican Republic",
                                    "DZ": "Algeria",
                                    "EA": "Ceuta & Melilla",
                                    "EC": "Ecuador",
                                    "EE": "Estonia",
                                    "EG": "Egypt",
                                    "EH": "Western Sahara",
                                    "ER": "Eritrea",
                                    "ES": "Spain",
                                    "ET": "Ethiopia",
                                    "EU": "European Union",
                                    "FI": "Finland",
                                    "FJ": "Fiji",
                                    "FK": "Falkland Islands",
                                    "FM": "Micronesia",
                                    "FO": "Faroe Islands",
                                    "FR": "France",
                                    "GA": "Gabon",
                                    "GB": "United Kingdom",
                                    "GD": "Grenada",
                                    "GE": "Georgia",
                                    "GF": "French Guiana",
                                    "GG": "Guernsey",
                                    "GH": "Ghana",
                                    "GI": "Gibraltar",
                                    "GL": "Greenland",
                                    "GM": "Gambia",
                                    "GN": "Guinea",
                                    "GP": "Guadeloupe",
                                    "GQ": "Equatorial Guinea",
                                    "GR": "Greece",
                                    "GS": "South Georgia & South Sandwich Islands",
                                    "GT": "Guatemala",
                                    "GU": "Guam",
                                    "GW": "Guinea-Bissau",
                                    "GY": "Guyana",
                                    "HK": "Hong Kong SAR China",
                                    "HM": "Heard & McDonald Islands",
                                    "HN": "Honduras",
                                    "HR": "Croatia",
                                    "HT": "Haiti",
                                    "HU": "Hungary",
                                    "IC": "Canary Islands",
                                    "ID": "Indonesia",
                                    "IE": "Ireland",
                                    "IL": "Israel",
                                    "IM": "Isle of Man",
                                    "IN": "India",
                                    "IO": "British Indian Ocean Territory",
                                    "IQ": "Iraq",
                                    "IR": "Iran",
                                    "IS": "Iceland",
                                    "IT": "Italy",
                                    "JE": "Jersey",
                                    "JM": "Jamaica",
                                    "JO": "Jordan",
                                    "JP": "Japan",
                                    "KE": "Kenya",
                                    "KG": "Kyrgyzstan",
                                    "KH": "Cambodia",
                                    "KI": "Kiribati",
                                    "KM": "Comoros",
                                    "KN": "St. Kitts & Nevis",
                                    "KP": "North Korea",
                                    "KR": "South Korea",
                                    "KW": "Kuwait",
                                    "KY": "Cayman Islands",
                                    "KZ": "Kazakhstan",
                                    "LA": "Laos",
                                    "LB": "Lebanon",
                                    "LC": "St. Lucia",
                                    "LI": "Liechtenstein",
                                    "LK": "Sri Lanka",
                                    "LR": "Liberia",
                                    "LS": "Lesotho",
                                    "LT": "Lithuania",
                                    "LU": "Luxembourg",
                                    "LV": "Latvia",
                                    "LY": "Libya",
                                    "MA": "Morocco",
                                    "MC": "Monaco",
                                    "MD": "Moldova",
                                    "ME": "Montenegro",
                                    "MF": "St. Martin",
                                    "MG": "Madagascar",
                                    "MH": "Marshall Islands",
                                    "MK": "North Macedonia",
                                    "ML": "Mali",
                                    "MM": "Myanmar (Burma)",
                                    "MN": "Mongolia",
                                    "MO": "Macao SAR China",
                                    "MP": "Northern Mariana Islands",
                                    "MQ": "Martinique",
                                    "MR": "Mauritania",
                                    "MS": "Montserrat",
                                    "MT": "Malta",
                                    "MU": "Mauritius",
                                    "MV": "Maldives",
                                    "MW": "Malawi",
                                    "MX": "Mexico",
                                    "MY": "Malaysia",
                                    "MZ": "Mozambique",
                                    "NA": "Namibia",
                                    "NC": "New Caledonia",
                                    "NE": "Niger",
                                    "NF": "Norfolk Island",
                                    "NG": "Nigeria",
                                    "NI": "Nicaragua",
                                    "NL": "Netherlands",
                                    "NO": "Norway",
                                    "NP": "Nepal",
                                    "NR": "Nauru",
                                    "NU": "Niue",
                                    "NZ": "New Zealand",
                                    "OM": "Oman",
                                    "PA": "Panama",
                                    "PE": "Peru",
                                    "PF": "French Polynesia",
                                    "PG": "Papua New Guinea",
                                    "PH": "Philippines",
                                    "PK": "Pakistan",
                                    "PL": "Poland",
                                    "PM": "St. Pierre & Miquelon",
                                    "PN": "Pitcairn Islands",
                                    "PR": "Puerto Rico",
                                    "PS": "Palestinian Territories",
                                    "PT": "Portugal",
                                    "PW": "Palau",
                                    "PY": "Paraguay",
                                    "QA": "Qatar",
                                    "RE": "Réunion",
                                    "RO": "Romania",
                                    "RS": "Serbia",
                                    "RU": "Russia",
                                    "RW": "Rwanda",
                                    "SA": "Saudi Arabia",
                                    "SB": "Solomon Islands",
                                    "SC": "Seychelles",
                                    "SD": "Sudan",
                                    "SE": "Sweden",
                                    "SG": "Singapore",
                                    "SH": "St. Helena",
                                    "SI": "Slovenia",
                                    "SJ": "Svalbard & Jan Mayen",
                                    "SK": "Slovakia",
                                    "SL": "Sierra Leone",
                                    "SM": "San Marino",
                                    "SN": "Senegal",
                                    "SO": "Somalia",
                                    "SR": "Suriname",
                                    "SS": "South Sudan",
                                    "ST": "São Tomé & Príncipe",
                                    "SV": "El Salvador",
                                    "SX": "Sint Maarten",
                                    "SY": "Syria",
                                    "SZ": "Eswatini",
                                    "TA": "Tristan da Cunha",
                                    "TC": "Turks & Caicos Islands",
                                    "TD": "Chad",
                                    "TF": "French Southern Territories",
                                    "TG": "Togo",
                                    "TH": "Thailand",
                                    "TJ": "Tajikistan",
                                    "TK": "Tokelau",
                                    "TL": "Timor-Leste",
                                    "TM": "Turkmenistan",
                                    "TN": "Tunisia",
                                    "TO": "Tonga",
                                    "TR": "Turkey",
                                    "TT": "Trinidad & Tobago",
                                    "TV": "Tuvalu",
                                    "TW": "Taiwan",
                                    "TZ": "Tanzania",
                                    "UA": "Ukraine",
                                    "UG": "Uganda",
                                    "UM": "U.S. Outlying Islands",
                                    "UN": "United Nations",
                                    "US": "United States",
                                    "UY": "Uruguay",
                                    "UZ": "Uzbekistan",
                                    "VA": "Vatican City",
                                    "VC": "St. Vincent & Grenadines",
                                    "VE": "Venezuela",
                                    "VG": "British Virgin Islands",
                                    "VI": "U.S. Virgin Islands",
                                    "VN": "Vietnam",
                                    "VU": "Vanuatu",
                                    "WF": "Wallis & Futuna",
                                    "WS": "Samoa",
                                    "XK": "Kosovo",
                                    "YE": "Yemen",
                                    "YT": "Mayotte",
                                    "ZA": "South Africa",
                                    "ZM": "Zambia",
                                    "ZW": "Zimbabwe"]

    
    let listFlagsCountries = ["Ascension Island": "🇦🇨",
                                    "Andorra": "🇦🇩",
                                    "United Arab Emirates": "🇦🇪",
                                    "Afghanistan": "🇦🇫",
                                    "Antigua & Barbuda": "🇦🇬",
                                    "Anguilla": "🇦🇮",
                                    "Albania": "🇦🇱",
                                    "Armenia": "🇦🇲",
                                    "Angola": "🇦🇴",
                                    "Antarctica": "🇦🇶",
                                    "Argentina": "🇦🇷",
                                    "American Samoa": "🇦🇸",
                                    "Austria": "🇦🇹",
                                    "Australia": "🇦🇺",
                                    "Aruba": "🇦🇼",
                                    "Åland Islands": "🇦🇽",
                                    "Azerbaijan": "🇦🇿",
                                    "Bosnia & Herzegovina": "🇧🇦",
                                    "Barbados": "🇧🇧",
                                    "Bangladesh": "🇧🇩",
                                    "Belgium": "🇧🇪",
                                    "Burkina Faso": "🇧🇫",
                                    "Bulgaria": "🇧🇬",
                                    "Bahrain": "🇧🇭",
                                    "Burundi": "🇧🇮",
                                    "Benin": "🇧🇯",
                                    "St. Barthélemy": "🇧🇱",
                                    "Bermuda": "🇧🇲",
                                    "Brunei": "🇧🇳",
                                    "Bolivia": "🇧🇴",
                                    "Caribbean Netherlands": "🇧🇶",
                                    "Brazil": "🇧🇷",
                                    "Bahamas": "🇧🇸",
                                    "Bhutan": "🇧🇹",
                                    "Bouvet Island": "🇧🇻",
                                    "Botswana": "🇧🇼",
                                    "Belarus": "🇧🇾",
                                    "Belize": "🇧🇿",
                                    "Canada": "🇨🇦",
                                    "Cocos (Keeling) Islands": "🇨🇨",
                                    "Congo - Kinshasa": "🇨🇩",
                                    "Central African Republic": "🇨🇫",
                                    "Congo - Brazzaville": "🇨🇬",
                                    "Switzerland": "🇨🇭",
                                    "Côte d’Ivoire": "🇨🇮",
                                    "Cook Islands": "🇨🇰",
                                    "Chile": "🇨🇱",
                                    "Cameroon": "🇨🇲",
                                    "China": "🇨🇳",
                                    "Colombia": "🇨🇴",
                                    "Clipperton Island": "🇨🇵",
                                    "Costa Rica": "🇨🇷",
                                    "Cuba": "🇨🇺",
                                    "Cape Verde": "🇨🇻",
                                    "Curaçao": "🇨🇼",
                                    "Christmas Island": "🇨🇽",
                                    "Cyprus": "🇨🇾",
                                    "Czechia": "🇨🇿",
                                    "Germany": "🇩🇪",
                                    "Diego Garcia": "🇩🇬",
                                    "Djibouti": "🇩🇯",
                                    "Denmark": "🇩🇰",
                                    "Dominica": "🇩🇲",
                                    "Dominican Republic": "🇩🇴",
                                    "Algeria": "🇩🇿",
                                    "Ceuta & Melilla": "🇪🇦",
                                    "Ecuador": "🇪🇨",
                                    "Estonia": "🇪🇪",
                                    "Egypt": "🇪🇬",
                                    "Western Sahara": "🇪🇭",
                                    "Eritrea": "🇪🇷",
                                    "Spain": "🇪🇸",
                                    "Ethiopia": "🇪🇹",
                                    "European Union": "🇪🇺",
                                    "Finland": "🇫🇮",
                                    "Fiji": "🇫🇯",
                                    "Falkland Islands": "🇫🇰",
                                    "Micronesia": "🇫🇲",
                                    "Faroe Islands": "🇫🇴",
                                    "France": "🇫🇷",
                                    "Gabon": "🇬🇦",
                                    "United Kingdom": "🇬🇧",
                                    "Grenada": "🇬🇩",
                                    "Georgia": "🇬🇪",
                                    "French Guiana": "🇬🇫",
                                    "Guernsey": "🇬🇬",
                                    "Ghana": "🇬🇭",
                                    "Gibraltar": "🇬🇮",
                                    "Greenland": "🇬🇱",
                                    "Gambia": "🇬🇲",
                                    "Guinea": "🇬🇳",
                                    "Guadeloupe": "🇬🇵",
                                    "Equatorial Guinea": "🇬🇶",
                                    "Greece": "🇬🇷",
                                    "South Georgia & South Sandwich Islands": "🇬🇸",
                                    "Guatemala": "🇬🇹",
                                    "Guam": "🇬🇺",
                                    "Guinea-Bissau": "🇬🇼",
                                    "Guyana": "🇬🇾",
                                    "Hong Kong SAR China": "🇭🇰",
                                    "Heard & McDonald Islands": "🇭🇲",
                                    "Honduras": "🇭🇳",
                                    "Croatia": "🇭🇷",
                                    "Haiti": "🇭🇹",
                                    "Hungary": "🇭🇺",
                                    "Canary Islands": "🇮🇨",
                                    "Indonesia": "🇮🇩",
                                    "Ireland": "🇮🇪",
                                    "Israel": "🇮🇱",
                                    "Isle of Man": "🇮🇲",
                                    "India": "🇮🇳",
                                    "British Indian Ocean Territory": "🇮🇴",
                                    "Iraq": "🇮🇶",
                                    "Iran": "🇮🇷",
                                    "Iceland": "🇮🇸",
                                    "Italy": "🇮🇹",
                                    "Jersey": "🇯🇪",
                                    "Jamaica": "🇯🇲",
                                    "Jordan": "🇯🇴",
                                    "Japan": "🇯🇵",
                                    "Kenya": "🇰🇪",
                                    "Kyrgyzstan": "🇰🇬",
                                    "Cambodia": "🇰🇭",
                                    "Kiribati": "🇰🇮",
                                    "Comoros": "🇰🇲",
                                    "St. Kitts & Nevis": "🇰🇳",
                                    "North Korea": "🇰🇵",
                                    "South Korea": "🇰🇷",
                                    "Kuwait": "🇰🇼",
                                    "Cayman Islands": "🇰🇾",
                                    "Kazakhstan": "🇰🇿",
                                    "Laos": "🇱🇦",
                                    "Lebanon": "🇱🇧",
                                    "St. Lucia": "🇱🇨",
                                    "Liechtenstein": "🇱🇮",
                                    "Sri Lanka": "🇱🇰",
                                    "Liberia": "🇱🇷",
                                    "Lesotho": "🇱🇸",
                                    "Lithuania": "🇱🇹",
                                    "Luxembourg": "🇱🇺",
                                    "Latvia": "🇱🇻",
                                    "Libya": "🇱🇾",
                                    "Morocco": "🇲🇦",
                                    "Monaco": "🇲🇨",
                                    "Moldova": "🇲🇩",
                                    "Montenegro": "🇲🇪",
                                    "St. Martin": "🇲🇫",
                                    "Madagascar": "🇲🇬",
                                    "Marshall Islands": "🇲🇭",
                                    "North Macedonia": "🇲🇰",
                                    "Mali": "🇲🇱",
                                    "Myanmar (Burma)": "🇲🇲",
                                    "Mongolia": "🇲🇳",
                                    "Macao SAR China": "🇲🇴",
                                    "Northern Mariana Islands": "🇲🇵",
                                    "Martinique": "🇲🇶",
                                    "Mauritania": "🇲🇷",
                                    "Montserrat": "🇲🇸",
                                    "Malta": "🇲🇹",
                                    "Mauritius": "🇲🇺",
                                    "Maldives": "🇲🇻",
                                    "Malawi": "🇲🇼",
                                    "Mexico": "🇲🇽",
                                    "Malaysia": "🇲🇾",
                                    "Mozambique": "🇲🇿",
                                    "Namibia": "🇳🇦",
                                    "New Caledonia": "🇳🇨",
                                    "Niger": "🇳🇪",
                                    "Norfolk Island": "🇳🇫",
                                    "Nigeria": "🇳🇬",
                                    "Nicaragua": "🇳🇮",
                                    "Netherlands": "🇳🇱",
                                    "Norway": "🇳🇴",
                                    "Nepal": "🇳🇵",
                                    "Nauru": "🇳🇷",
                                    "Niue": "🇳🇺",
                                    "New Zealand": "🇳🇿",
                                    "Oman": "🇴🇲",
                                    "Panama": "🇵🇦",
                                    "Peru": "🇵🇪",
                                    "French Polynesia": "🇵🇫",
                                    "Papua New Guinea": "🇵🇬",
                                    "Philippines": "🇵🇭",
                                    "Pakistan": "🇵🇰",
                                    "Poland": "🇵🇱",
                                    "St. Pierre & Miquelon": "🇵🇲",
                                    "Pitcairn Islands": "🇵🇳",
                                    "Puerto Rico": "🇵🇷",
                                    "Palestinian Territories": "🇵🇸",
                                    "Portugal": "🇵🇹",
                                    "Palau": "🇵🇼",
                                    "Paraguay": "🇵🇾",
                                    "Qatar": "🇶🇦",
                                    "Réunion": "🇷🇪",
                                    "Romania": "🇷🇴",
                                    "Serbia": "🇷🇸",
                                    "Russia": "🇷🇺",
                                    "Rwanda": "🇷🇼",
                                    "Saudi Arabia": "🇸🇦",
                                    "Solomon Islands": "🇸🇧",
                                    "Seychelles": "🇸🇨",
                                    "Sudan": "🇸🇩",
                                    "Sweden": "🇸🇪",
                                    "Singapore": "🇸🇬",
                                    "St. Helena": "🇸🇭",
                                    "Slovenia": "🇸🇮",
                                    "Svalbard & Jan Mayen": "🇸🇯",
                                    "Slovakia": "🇸🇰",
                                    "Sierra Leone": "🇸🇱",
                                    "San Marino": "🇸🇲",
                                    "Senegal": "🇸🇳",
                                    "Somalia": "🇸🇴",
                                    "Suriname": "🇸🇷",
                                    "South Sudan": "🇸🇸",
                                    "São Tomé & Príncipe": "🇸🇹",
                                    "El Salvador": "🇸🇻",
                                    "Sint Maarten": "🇸🇽",
                                    "Syria": "🇸🇾",
                                    "Eswatini": "🇸🇿",
                                    "Tristan da Cunha": "🇹🇦",
                                    "Turks & Caicos Islands": "🇹🇨",
                                    "Chad": "🇹🇩",
                                    "French Southern Territories": "🇹🇫",
                                    "Togo": "🇹🇬",
                                    "Thailand": "🇹🇭",
                                    "Tajikistan": "🇹🇯",
                                    "Tokelau": "🇹🇰",
                                    "Timor-Leste": "🇹🇱",
                                    "Turkmenistan": "🇹🇲",
                                    "Tunisia": "🇹🇳",
                                    "Tonga": "🇹🇴",
                                    "Turkey": "🇹🇷",
                                    "Trinidad & Tobago": "🇹🇹",
                                    "Tuvalu": "🇹🇻",
                                    "Taiwan": "🇹🇼",
                                    "Tanzania": "🇹🇿",
                                    "Ukraine": "🇺🇦",
                                    "Uganda": "🇺🇬",
                                    "U.S. Outlying Islands": "🇺🇲",
                                    "United Nations": "🇺🇳",
                                    "United States": "🇺🇸",
                                    "Uruguay": "🇺🇾",
                                    "Uzbekistan": "🇺🇿",
                                    "Vatican City": "🇻🇦",
                                    "St. Vincent & Grenadines": "🇻🇨",
                                    "Venezuela": "🇻🇪",
                                    "British Virgin Islands": "🇻🇬",
                                    "U.S. Virgin Islands": "🇻🇮",
                                    "Vietnam": "🇻🇳",
                                    "Vanuatu": "🇻🇺",
                                    "Wallis & Futuna": "🇼🇫",
                                    "Samoa": "🇼🇸",
                                    "Kosovo": "🇽🇰",
                                    "Yemen": "🇾🇪",
                                    "Mayotte": "🇾🇹",
                                    "South Africa": "🇿🇦",
                                    "Zambia": "🇿🇲",
                                    "Zimbabwe": "🇿🇼"]
    
    var vocabularyCodeCountriesList = [String]()
    var vocabularyNameCountriesList = [String]()
    var vocabularyFlagsCountriesList = [String]()
    var vocabularyCurrencyCountriesList = [Double]()
    
    var arrayCodeCountries = [String]()
    var arrayNamesCountries = [String]()
    var arrayFlagsCountries = [String]()
    var arrayCurrencyCountries = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isEditing = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
            
            setupNavigationBar()
            getData()
        }
    
    func setupNavigationBar() {
        
        navigationController!.navigationBar.tintColor = UIColor.orange
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Futura Bold", size: 25), size: 25)]
        
        navBarApperance.backgroundColor = UIColor(red: 225/225, green: 225/225, blue: 225/225, alpha: 225/225)
        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
    }
        
        func getData() {
            
            let url = URL(string: "https://open.er-api.com/v6/latest/USD")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: url!) { data, response, error in
                
                if error != nil {
                    print(error?.localizedDescription as Any)
                    
                } else {
                    
                    if data != nil {
                        
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                            
                            print(jsonResponse)
                            
                            DispatchQueue.main.async { [self] in
                                
                                let array = Array(jsonResponse["rates"] as! [String : Double])
                                
                                for (key, value) in array {
                                    
                                    var entity = CurrencyConversion()
                                    entity.code = key
                                    entity.value = value
                                    self.listCurrencyCountries.updateValue(value, forKey: key)
                                    
                                }
                                
                                for (currencyKey, currencyValues) in Array(listCurrencyCountries).sorted(by: {$0.0 < $1.0}) {
                                    
                                    for (codeKey, codeValue) in Array(listCodeCountries) {
                                        if currencyKey == codeValue {
                                            vocabularyCodeCountriesList.append(codeValue)
                                            vocabularyCurrencyCountriesList.append(currencyValues)
                                            
                                            for (nameKey, nameValue) in Array(listNamesCountries) {
                                                if nameKey == codeKey {
                                                    vocabularyNameCountriesList.append(nameValue)
                                                    
                                                    for (flagKey, flagValue) in Array(listFlagsCountries) {
                                                        if flagKey == nameValue {
                                                            vocabularyFlagsCountriesList.append(flagValue)
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            
                                print(vocabularyCurrencyCountriesList.count)
                                print(vocabularyFlagsCountriesList.count)
                                print(vocabularyNameCountriesList.count)
                                print(vocabularyCodeCountriesList.count)
                                self.tableView.reloadData()
                            }
                            
                        } catch {
                            print("error")
                        }
                        
                    }
                }
            }
            task.resume()
        }
        
        func selectDeselectCell(tabelView: UITableView, indexPath: IndexPath) {
            
            arrayFlagsCountries.removeAll()
            arrayNamesCountries.removeAll()
            arrayCodeCountries.removeAll()
            arrayCurrencyCountries.removeAll()
            
            if UserDefaults.standard.object(forKey: "flag") != nil {
                arrayFlagsCountries = UserDefaults.standard.object(forKey: "flag") as? [String] ?? []
            }
            if UserDefaults.standard.object(forKey: "name") != nil {
                arrayNamesCountries = UserDefaults.standard.object(forKey: "name") as? [String] ?? []
            }
            if UserDefaults.standard.object(forKey: "code") != nil {
                arrayCodeCountries = UserDefaults.standard.object(forKey: "code") as? [String] ?? []
            }
            if UserDefaults.standard.object(forKey: "currency") != nil {
                arrayCurrencyCountries = UserDefaults.standard.object(forKey: "currency") as? [Double] ?? []
            }
            
            
            if let array = tableView.indexPathsForSelectedRows {
                for index in array {
                    
                    if !arrayNamesCountries.contains(vocabularyNameCountriesList[index.row]) {
                        arrayCodeCountries.insert(vocabularyCodeCountriesList[index.row], at: 0)
                        arrayCurrencyCountries.insert(vocabularyCurrencyCountriesList[index.row], at: 0)
                        arrayNamesCountries.insert(vocabularyNameCountriesList[index.row], at: 0)
                        arrayFlagsCountries.insert(vocabularyFlagsCountriesList[index.row], at: 0)
                    }
                }
            }
            
            print(arrayFlagsCountries)
            print(arrayNamesCountries)
            print(arrayCodeCountries)
            print(arrayCurrencyCountries)
        }
    
    @IBAction func saveButtonClick(_ sender: Any) {

        
        if arrayCodeCountries != [] {
            UserDefaults.standard.setValue(arrayFlagsCountries, forKey: "flag")
            UserDefaults.standard.setValue(arrayNamesCountries, forKey: "name")
            UserDefaults.standard.setValue(arrayCodeCountries, forKey: "code")
            UserDefaults.standard.setValue(arrayCurrencyCountries, forKey: "currency")
        }
        
        print(arrayFlagsCountries)
        print(arrayNamesCountries)
        print(arrayCodeCountries)
        print(arrayCurrencyCountries)
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        self.present(loginVC, animated: true, completion: nil)
    }
}

// MARK: - Table View Controller (value output)
extension AdditionalViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularyFlagsCountriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdditionalTableViewCell
        cell.flagCountries.text = String(vocabularyFlagsCountriesList[indexPath.row])
        cell.nameCountries.text = String(vocabularyNameCountriesList[indexPath.row])
        cell.codeCountries.text = String(vocabularyCodeCountriesList[indexPath.row])
        
        var i = 0
        var j = 0
        
        for _ in vocabularyNameCountriesList {
            
            if UserDefaults.standard.object(forKey: "name") != nil {
                arrayNamesCountries = UserDefaults.standard.object(forKey: "name") as? [String] ?? []
            } else {
                arrayNamesCountries = ["error..."]
            }
            
            if vocabularyNameCountriesList[i] == arrayNamesCountries[j] {
                print(arrayNamesCountries[j])
                tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: .none)
                
                i = 0
                if j < (arrayNamesCountries.count - 1) {
                    j += 1
                } else {
                    break
                }
            } else {
                i += 1
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tabelView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tabelView: tableView, indexPath: indexPath)
    }
}

