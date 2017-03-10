-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-03-09 09:50:49','2017-03-09 09:50:49');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `content_md` text,
  `date` varchar(255) DEFAULT NULL,
  `tag` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'速递易工作总结及感想','<p>时间过得飞快，一转眼我都实习了快5个月了。</p>\n\n<p><strong>工作总结</strong></p>\n\n<p>我把目前为止所做的工作分为三个阶段来总结：</p>\n\n<p>第一阶段是学习阶段，作为一个实习生，我的主要任务是学习基础知识，只有把基础的知识掌握好了才能谈其他东西。这个阶段我主要是看了三本书，分别是《Programming Ruby》、《ruby基础教程》和《rails tutorial》。入职前我得到了《Programming Ruby》《ruby基础教程》这两本书，我要求自己在入职之前的9天内把他们啃掉，一共1424页，这对我来说是一个不小的挑战，因为毕竟这是技术书籍，不是看小说，边看还要边理解、学习。刚接触ruby没多久，不懂的东西太多了，于是国庆节7天我就待在家里死磕，每天除了吃饭睡觉都是在学这个东西。最后我也基本完成了这个目标。通过这次学习，我掌握了很多ruby和rails相关的基础知识。从这个阶段中总结的一个经验就是，学一门语言首要解决的问题是迟迟不肯开始动手，如果只是看书而没有实际的练习就很容易忘掉，最后等书全部看完忘得也差不多了。所以务必要尽快进入实操的阶段，尽量通过解决实际问题来整合知识、巩固知识并加深理解。之后我做了一个日志练习学会相关的操作，包括状态码计数、相关gem的使用、代码的优化、重构等等，我认为这是一个很好的入门练习，所涉及的知识很全面，基本涵盖了我之前学到的所有基础知识，同时也加深了我的理解。这个练习我重构了三次，可以看到每次都有所进步，最后的效果是明显的，和刚开始写出来的东西相比优化了很多。这个做完之后我开始写爬虫来抓取豆瓣的一些数据，然后在后台展示出来。这是我第一次接触爬虫，通过这个练习也学到了很多知识，后台框架先是用了sinatra后用rails，帮助我更加了解了这两个框架。</p>\n\n<p>第二阶段是接触项目的阶段，基础的东西学完了，我开始接触公司的实际项目，这是我第一次看到真实的项目代码是什么样子。刚开始是一头雾水的，每块内容单独来看虽然好像看得懂，但我不清楚到底做了些什么，不清楚它们的内在联系或是一些细节的东西。我甚至连把项目跑起来都花了很长的时间。通过这个阶段，我开始更多地和公司其他人有了交流合作，相对来说公司的项目代码比一些其他的个人写的代码更加规范，更有可读性和学习价值。我了解了一些开发流程，学会了一些技能和方法（比如git相关操作），第一次接触了前后端分离，也了解了一个公司里面的各个部门的员工到底是在做些什么事情（以前我不知道公司要分产品、测试、前端后端这些部门，学校可不会教这些东西，我以为这些都是一个人做的）。</p>\n\n<p>第三阶段是参与开发的阶段，正好公司有新项目来了，这次我参与了经分系统的开发，从需求分析，出原型，讨论修改，到后端开发，前端开发，联调，测试等，我第一次经历了这个完整的开发流程。说实话学到的干货不是很多，但是更多的是学到了一个项目从构思到最后完成要经历哪些过程，我觉得这个就和修房子是一样的，先作好图纸规划，打好地基，然后一步步往上建造，最后竣工。除此之外还锻炼了我的团队协作能力、交流沟通能力等，更重要的是解决问题的能力。我想一个程序员很重要的两个能力就是超强的自学能力和分析解决问题的能力。当我实习完后，可能这些项目若干年后也没用了，就是一堆符号而已，若干年后我自己回去看我写的这些代码可能也看不懂了，但是解决问题的能力是很重要的，这个报错完了还会出下一个报错，不能解决就寸步难行。学习能力也是一样，有自学能力什么都可以再学，知识总是在进步的。</p>\n\n<p><strong>感想</strong></p>\n\n<p>我还记得人生第一天上班的心情是激动的，第一次走出学校，了解到一家公司是怎样运作的，一切对我来说都很新鲜。\n  刚开始时每天要回学校住，不过我坚持了一周就受不了了，原因是太远，每天早上挤地铁晚上等公交，来回至少4小时。 于是我果断在附近租了房子，没有别的要求，越近越好！ 按此要求专门请假了一天去看房子，所以最后我只需要漫步7分钟就能到公司。我非常高兴，因为这样我可以节省更多时间花在学习上了。</p>\n\n<p>公司氛围很好，大家相处得很融洽，刚来公司时我可以说是除了看过一点书，什么都不会，就连git提交代码我也是一脸懵逼。不过很快我就熟悉了，也学到了一些东西。但每天大家在公司说的很多专业名词，钉钉里的很多讨论，我其实还是云里雾里，不明嚼栗的。我觉得我不懂的实在太多，恨不得抓紧时间全部学完，我甚至想过每天就睡在公司还可以不用租房子，我把牙刷毛巾带来，正好厕所也可以洗漱哈哈哈:)</p>\n\n<p>我认为我也是<a href=\"http://baike.baidu.com/link?url=e7KzgazS83zXdsvsV7mDkyTLEEQN6aNGzM8BqFoiPHMaIcseSI-b5Ae8YIufBnx6R3eyWx3peCYoBwADNni3-unrWQmA-axIJDfmIhETT7Eb-Y81DzvLyW7m0pOqENxq\">九型性格</a>中偏和平型和完美型和人。我虽然平时话很少，但我看&amp;听得比较多。我还记得达达说的付出多少就收获多少，记得第一次和海洋哥一起加班到23点，记得凯哥耐心的项目讲解和指导，记得刚上班时丁哥过来和我打招呼（这次快递员迭代我没能做完深感遗憾），还有和赵伟一起学习公司文化，和磊哥的交流很开心，和Andy一起互相帮助一起打球，和周佳成合作写爬虫，还有每天总是到的最早的杨哥和超超，给我莫大帮助的小虫哥，给我们橘子吃的朱老师……整个后端开发团队，你们真的很棒！虽然实习时间不长，但我真的很高兴认识大家。我的生活很单调，每天两点一线，在公司工作让我感到不孤独、有归属感。</p>\n\n<p>最近由于学校方面的原因我不得不暂停实习了，说实话这是一个艰难的决定。不远的将来我还希望能和大家共同成长。</p>\n\n<p>最后祝 <code>{ 速递易: 越来越好, 各位小伙伴: []  &lt;&lt; &quot;文档自动生成&quot; &lt;&lt; &quot;测试一次通过&quot; &lt;&lt; &quot;代码无bug&quot; &lt;&lt; &quot;老板不改需求&quot; &lt;&lt; &quot;服务没有报警&quot; }</code> 好了可以下班了。</p>\n','  时间过得飞快，一转眼我都实习了快5个月了。\r\n\r\n  **工作总结**\r\n\r\n  我把目前为止所做的工作分为三个阶段来总结：\r\n   \r\n  第一阶段是学习阶段，作为一个实习生，我的主要任务是学习基础知识，只有把基础的知识掌握好了才能谈其他东西。这个阶段我主要是看了三本书，分别是《Programming Ruby》、《ruby基础教程》和《rails tutorial》。入职前我得到了《Programming Ruby》《ruby基础教程》这两本书，我要求自己在入职之前的9天内把他们啃掉，一共1424页，这对我来说是一个不小的挑战，因为毕竟这是技术书籍，不是看小说，边看还要边理解、学习。刚接触ruby没多久，不懂的东西太多了，于是国庆节7天我就待在家里死磕，每天除了吃饭睡觉都是在学这个东西。最后我也基本完成了这个目标。通过这次学习，我掌握了很多ruby和rails相关的基础知识。从这个阶段中总结的一个经验就是，学一门语言首要解决的问题是迟迟不肯开始动手，如果只是看书而没有实际的练习就很容易忘掉，最后等书全部看完忘得也差不多了。所以务必要尽快进入实操的阶段，尽量通过解决实际问题来整合知识、巩固知识并加深理解。之后我做了一个日志练习学会相关的操作，包括状态码计数、相关gem的使用、代码的优化、重构等等，我认为这是一个很好的入门练习，所涉及的知识很全面，基本涵盖了我之前学到的所有基础知识，同时也加深了我的理解。这个练习我重构了三次，可以看到每次都有所进步，最后的效果是明显的，和刚开始写出来的东西相比优化了很多。这个做完之后我开始写爬虫来抓取豆瓣的一些数据，然后在后台展示出来。这是我第一次接触爬虫，通过这个练习也学到了很多知识，后台框架先是用了sinatra后用rails，帮助我更加了解了这两个框架。\r\n\r\n  第二阶段是接触项目的阶段，基础的东西学完了，我开始接触公司的实际项目，这是我第一次看到真实的项目代码是什么样子。刚开始是一头雾水的，每块内容单独来看虽然好像看得懂，但我不清楚到底做了些什么，不清楚它们的内在联系或是一些细节的东西。我甚至连把项目跑起来都花了很长的时间。通过这个阶段，我开始更多地和公司其他人有了交流合作，相对来说公司的项目代码比一些其他的个人写的代码更加规范，更有可读性和学习价值。我了解了一些开发流程，学会了一些技能和方法（比如git相关操作），第一次接触了前后端分离，也了解了一个公司里面的各个部门的员工到底是在做些什么事情（以前我不知道公司要分产品、测试、前端后端这些部门，学校可不会教这些东西，我以为这些都是一个人做的）。\r\n\r\n  第三阶段是参与开发的阶段，正好公司有新项目来了，这次我参与了经分系统的开发，从需求分析，出原型，讨论修改，到后端开发，前端开发，联调，测试等，我第一次经历了这个完整的开发流程。说实话学到的干货不是很多，但是更多的是学到了一个项目从构思到最后完成要经历哪些过程，我觉得这个就和修房子是一样的，先作好图纸规划，打好地基，然后一步步往上建造，最后竣工。除此之外还锻炼了我的团队协作能力、交流沟通能力等，更重要的是解决问题的能力。我想一个程序员很重要的两个能力就是超强的自学能力和分析解决问题的能力。当我实习完后，可能这些项目若干年后也没用了，就是一堆符号而已，若干年后我自己回去看我写的这些代码可能也看不懂了，但是解决问题的能力是很重要的，这个报错完了还会出下一个报错，不能解决就寸步难行。学习能力也是一样，有自学能力什么都可以再学，知识总是在进步的。\r\n\r\n  **感想**\r\n\r\n  我还记得人生第一天上班的心情是激动的，第一次走出学校，了解到一家公司是怎样运作的，一切对我来说都很新鲜。\r\n  刚开始时每天要回学校住，不过我坚持了一周就受不了了，原因是太远，每天早上挤地铁晚上等公交，来回至少4小时。 于是我果断在附近租了房子，没有别的要求，越近越好！ 按此要求专门请假了一天去看房子，所以最后我只需要漫步7分钟就能到公司。我非常高兴，因为这样我可以节省更多时间花在学习上了。\r\n\r\n  公司氛围很好，大家相处得很融洽，刚来公司时我可以说是除了看过一点书，什么都不会，就连git提交代码我也是一脸懵逼。不过很快我就熟悉了，也学到了一些东西。但每天大家在公司说的很多专业名词，钉钉里的很多讨论，我其实还是云里雾里，不明嚼栗的。我觉得我不懂的实在太多，恨不得抓紧时间全部学完，我甚至想过每天就睡在公司还可以不用租房子，我把牙刷毛巾带来，正好厕所也可以洗漱哈哈哈:)\r\n\r\n  我认为我也是[九型性格](http://baike.baidu.com/link?url=e7KzgazS83zXdsvsV7mDkyTLEEQN6aNGzM8BqFoiPHMaIcseSI-b5Ae8YIufBnx6R3eyWx3peCYoBwADNni3-unrWQmA-axIJDfmIhETT7Eb-Y81DzvLyW7m0pOqENxq)中偏和平型和完美型和人。我虽然平时话很少，但我看&听得比较多。我还记得达达说的付出多少就收获多少，记得第一次和海洋哥一起加班到23点，记得凯哥耐心的项目讲解和指导，记得刚上班时丁哥过来和我打招呼（这次快递员迭代我没能做完深感遗憾），还有和赵伟一起学习公司文化，和磊哥的交流很开心，和Andy一起互相帮助一起打球，和周佳成合作写爬虫，还有每天总是到的最早的杨哥和超超，给我莫大帮助的小虫哥，给我们橘子吃的朱老师……整个后端开发团队，你们真的很棒！虽然实习时间不长，但我真的很高兴认识大家。我的生活很单调，每天两点一线，在公司工作让我感到不孤独、有归属感。\r\n\r\n  最近由于学校方面的原因我不得不暂停实习了，说实话这是一个艰难的决定。不远的将来我还希望能和大家共同成长。\r\n\r\n  最后祝 `{ 速递易: 越来越好, 各位小伙伴: []  << \"文档自动生成\" << \"测试一次通过\" << \"代码无bug\" << \"老板不改需求\" << \"服务没有报警\" }` 好了可以下班了。','2017-03','^^总结','2017-03-10 06:01:26','2017-03-10 06:03:31');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commenter` varchar(255) DEFAULT NULL,
  `body` text,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_article_id` (`article_id`),
  CONSTRAINT `fk_rails_3bf61a60d3` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160921062856'),('20160922145535'),('20170125063834'),('20170306100956');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'总结','2017-03-10 06:00:19','2017-03-10 06:00:19');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-11  0:29:44
