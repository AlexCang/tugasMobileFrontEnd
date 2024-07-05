import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Widgets/Article.dart';
import 'package:medical/Screens/Widgets/ArticleDetailPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  TextEditingController _searchController = TextEditingController();
  List<ArticleData> _articles = [
    ArticleData(
      imagePath: "images/article1.png",
      title: "How much Vitamin D do you need?",
      date: "7/2/2023",
      duration: "8 min read",
      articleContent: """
Vitamin D is an essential nutrient that plays a crucial role in maintaining bone health and overall well-being. It helps regulate calcium and phosphate levels in the body, which are important for bone growth, maintenance, and repair.

This article explores the recommended daily intake of Vitamin D, its sources, and the benefits it provides. It discusses how sunlight exposure contributes to Vitamin D production in the skin and the role of dietary sources such as fatty fish, fortified dairy products, and supplements.

Understanding Vitamin D's impact on immune function, muscle strength, and cardiovascular health is also covered, highlighting its significance beyond bone health alone. Whether you're interested in optimizing your Vitamin D levels or learning more about its diverse benefits, this article provides valuable insights and practical information.
""",
    ),
    ArticleData(
      imagePath: "images/capsules.png",
      title: "The Importance of Omega-3 Fatty Acids",
      date: "7/5/2023",
      duration: "5 min read",
      articleContent: """
Omega-3 fatty acids are polyunsaturated fats that are crucial for maintaining heart health and promoting overall well-being. They are known for their anti-inflammatory properties and play a vital role in brain function, reducing the risk of heart disease, and supporting healthy skin.

This article delves into the different types of Omega-3s, including EPA (eicosapentaenoic acid) and DHA (docosahexaenoic acid), their sources, and their health benefits. It explores how consuming fatty fish like salmon, mackerel, and sardines, as well as plant-based sources like flaxseeds and walnuts, can provide essential Omega-3s.

Understanding the recommended intake of Omega-3s for different age groups and health conditions is also discussed, offering practical insights into incorporating these beneficial fats into your diet. Whether you're interested in cardiovascular health, brain function, or overall wellness, Omega-3 fatty acids are an essential nutrient worth exploring.
""",
    ),
    ArticleData(
      imagePath: "images/capsules2.png",
      title: "Understanding Probiotics and Gut Health",
      date: "7/8/2023",
      duration: "6 min read",
      articleContent: """
Probiotics are live microorganisms that provide health benefits when consumed in adequate amounts. They play a significant role in maintaining gut health, supporting digestion, and enhancing immune function.

This article explores the different types of probiotics, including strains like Lactobacillus and Bifidobacterium, and their sources. It discusses fermented foods such as yogurt, kefir, sauerkraut, and kimchi, which naturally contain probiotics.

The article also delves into the potential health benefits of probiotics, such as alleviating gastrointestinal disorders like irritable bowel syndrome (IBS) and promoting a healthy balance of gut bacteria. It examines how probiotics may contribute to overall well-being beyond digestive health, including their impact on immune responses and inflammation.

Whether you're curious about enhancing your gut microbiome or seeking ways to support digestive health, understanding probiotics can provide valuable insights into optimizing your well-being.
""",
    ),
  ];

  List<ArticleData> _filteredArticles = [];

  @override
  void initState() {
    super.initState();
    _filteredArticles
        .addAll(_articles); // Initialize filtered list with all articles
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredArticles = _articles.where((article) {
        return article.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Articles",
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(type: PageTransitionType.fade, child: Homepage()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8), // Padding around the image
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
                  .withOpacity(0.3), // Background color behind the image
            ),
            child: Image.asset(
              "lib/icons/back1.png",
              width: 10, // Adjust the size of the image
              height: 10,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Image.asset(
                "lib/icons/more.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
        backgroundColor: theme.colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: _searchController,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.none,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    focusColor: Colors.black26,
                    fillColor: theme.colorScheme.surface,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                        width: MediaQuery.of(context).size.width * 0.01,
                        child: Image.asset(
                          "lib/icons/search.png",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Search articles...",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Popular Articles",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryChip("Covid-19"),
                        const SizedBox(width: 10),
                        _buildCategoryChip("Diet"),
                        const SizedBox(width: 10),
                        _buildCategoryChip("Fitness"),
                        const SizedBox(width: 10),
                        _buildCategoryChip("Medicines"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Trending Articles",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filteredArticles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                    child: _buildTrendingArticle(
                        context, _filteredArticles[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingArticle(BuildContext context, ArticleData article) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(
              image: article.imagePath,
              mainText: article.title,
              dateText: article.date,
              duration: article.duration,
              articleContent: article.articleContent,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                article.imagePath,
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.title,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.date,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  article.duration,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Chip(
      backgroundColor: const Color.fromARGB(255, 2, 173, 131),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      label: Text(
        category,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
      elevation: 0, // Remove any shadow or elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Match the border radius
        side: BorderSide.none, // Remove the border line
      ),
    );
  }
}

class ArticleData {
  final String imagePath;
  final String title;
  final String date;
  final String duration;
  final String articleContent;

  ArticleData({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.duration,
    required this.articleContent,
  });
}
