import 'dart:convert';
import 'package:breaking_news/services/news_template.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:breaking_news/model/news.dart';

  List<String> categoryItems = [
    'sport',
    'business',
    'politics',
    'health',
  ];

  List<String> countryItems = [
    'eg','de','do','ec','es','fi','gb','gr','hk',
    'fr','hr','id','il','iq','is','jo','ke','kw',
    'ae','lt','lu','ma','mt','mx','nl','no','pa',
    'am','ph','pq','pt','qa','ru','se','sk','sp',
    'at','sy','th','tr','us','ye','al','ar','au',
    'az','ba','bg','bo','ca','cl','co','cz','dk',
    'be','dz','ee','ge','gt','hn','hu','ie','in',
    'bh','ir','it','jp','kr','lb','lv','ly','mk',
    'br','my','ni','nz','om','pe','pl','pr','py',
    'ch','ro','sa','sg','sl','sv','tw','tn','ua',
    'cn','vn','za', 'cr',
  ];


