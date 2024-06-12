import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  ProfilePage({required this.onThemeChanged, required this.isDarkMode});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _resumeFile;

  Future<void> _pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      setState(() {
        _resumeFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.isDarkMode ? Colors.black : Color.fromARGB(255, 206, 221, 233),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Apurba karmokar',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Student of CSE in Daffodil International University',
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        widget.isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Professional Summary'),
              Text(
                'An ML-savvy programmer fluent in English and Bengali, excelling in teamwork and project management, driven to uplift our nation through impactful contributions.',
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isDarkMode ? Colors.grey[400] : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 32),
              _buildSectionTitle('Education'),
              _buildEducationItem(
                'B.Sc. in Computer Science and Engineering',
                'Daffodil International University',
                'Graduation Year: 2024',
              ),
              _buildEducationItem(
                'HSC in Science',
                'Cantorment Public School And College Lalmonirhat',
                'Year: (2018 - 2020)',
              ),
              _buildEducationItem(
                'SSC in Science',
                'Patgram TN High School and College',
                'Year: (2015 - 2017)',
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('Skills'),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: <String>[
                  'C',
                  'C++',
                  'Java',
                  'Python',
                  'HTML',
                  'CSS',
                  'CNN',
                  'IoT',
                  'Dart',
                  'Flutter',
                  'Arduino',
                  'Research',
                  'Data Analysis',
                  'Machine Learning'
                      'Vision Transformer',
                ].map((skill) => Chip(label: Text(skill))).toList(),
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('Experience'),
              ProjectCard(
                title: 'Researcher',
                description: '''Daffodil International University
Since 2023, actively writing research papers on Machine Learning, YOLO, and VIT to foster innovation and advance technology.''',
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('My Hobbies'),
              ProjectCard(
                title: 'Playing Football',
                description:
                    '''* A dedicated programmer passionate about football, proficient in ML algorithms, fluent in English and Bengali, finding joy in teamwork on and off the field. ''',
              ),
              ProjectCard(
                title: 'Drawing',
                description:
                    '''* Passionate about drawing, creating detailed sketches and vibrant artworks that capture the beauty of everyday life. Enjoy experimenting with different mediums and styles, continually honing my artistic skills.''',
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('Resume/CV'),
              Center(
                child: ElevatedButton(
                  onPressed: _pickResume,
                  child: Text('Upload Resume/CV'),
                ),
              ),
              if (_resumeFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Uploaded: ${_resumeFile!.path.split('/').last}',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('Social Media'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    color: Color.fromARGB(255, 65, 3, 236),
                    iconSize: 40,
                    onPressed: facebook_url,
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    color: Color.fromARGB(255, 65, 3, 236),
                    iconSize: 40,
                    onPressed: github_url,
                  ),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      color: Color.fromARGB(255, 65, 3, 236),
                      iconSize: 43,
                      onPressed: linked_in_url),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      color: Color.fromARGB(255, 65, 3, 236),
                      iconSize: 43,
                      onPressed: instagram_url),
                ],
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 65, 3, 236)),
              SizedBox(height: 24),
              _buildSectionTitle('Blog'),
              Center(
                child: BlogSection(),
              ),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              SizedBox(height: 24),
              _buildSectionTitle('Achievements & Certifications'),
              ProjectCard(
                title: 'Competitions',
                description:
                    ''' I have an interest with new technology and topics. So that, I like to participate in competation and Quizes. ''',
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _pickResume,
                  child: Text('Upload Achievements/Certifications'),
                ),
              ),
              if (_resumeFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Uploaded: ${_resumeFile!.path.split('/').last}',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              SizedBox(height: 24),
              Divider(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Color.fromARGB(255, 255, 0, 0)),
              _buildSectionTitle('Contact Information'),
              ListTile(
                leading: Icon(Icons.email),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () =>
                          launch('mailto:karmokar15-4175@diu.edu.bd'),
                      child: Text('karmokar15-4175@diu.edu.bd'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () => launch('tel:+8801714762628'),
                      child: Text('+8801714762628'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () => launch('https://sites.google.com'),
                      child: Text('https://sites.google.com'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: widget.isDarkMode ? Colors.white : Colors.orangeAccent,
      ),
    );
  }

  Widget _buildEducationItem(String degree, String institution, String period) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school,
              color: widget.isDarkMode ? Colors.white : Colors.orangeAccent),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  institution,
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.black,
                  ),
                ),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        widget.isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      String title, String company, String period, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.work,
              color: widget.isDarkMode ? Colors.white : Colors.orangeAccent),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.black,
                  ),
                ),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        widget.isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

linked_in_url() async {
  const url = 'https://www.linkedin.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

facebook_url() async {
  const url = 'https://web.facebook.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

github_url() async {
  const url = 'https://github.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

instagram_url() async {
  const url = 'https://www.instagram.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                //color: widget.isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                  //color: widget.isDarkMode ? Colors.black : Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogSection extends StatefulWidget {
  @override
  _BlogSectionState createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  final List<Map<String, String>> _blogPosts = [];

  void _addBlogPost() {
    showDialog(
      context: context,
      builder: (context) {
        final titleController = TextEditingController();
        final contentController = TextEditingController();
        return AlertDialog(
          title: Text('New Blog Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            Center(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _blogPosts.add({
                          'title': titleController.text,
                          'content': contentController.text,
                        });
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _addBlogPost,
          child: Text('Add Blog Post'),
        ),
        ..._blogPosts.map((post) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //color: widget.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    post['content']!,
                    style: TextStyle(
                        //color: widget.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
