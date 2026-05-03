//using AutoMapper;
//using eDentist.Model.Models;
//using eDentist.Model.Requests;
//using eDentist.Model.SearchObjects;
//using eDentist.Services.Database;
//using Microsoft.EntityFrameworkCore;
//using Microsoft.ML.Data;
//using Microsoft.ML.Trainers;
//using Microsoft.ML;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace eDentist.Services.Services
//{
//    public class BlogPostRecommendationService : BaseCrudService<BlogPost, BlogPost, BaseSearchObject, BlogPostUpsertRequest, BlogPostUpsertRequest>, IBlogPostRecommendationService
//    {
//        private static MLContext mlContext = null;
//        private static object isLocked = new object();
//        private static ITransformer modeltr = null;

//        public BlogPostRecommendationService(EDentistDbContext context, IMapper mapper)
//            : base(context, mapper)
//        {
//        }

//        public List<BlogPostModel> Recommend(int? userId)
//        {
//            lock (isLocked)
//            {
//                if (mlContext == null)
//                {
//                    mlContext = new MLContext();

//                    var userData = _context.MedicalCards
//                        .Include(mc => mc.DentalService)
//                        .Where(mc => mc.UserId == userId)
//                        .ToList();

//                    var blogData = _context.BlogPosts.ToList();

//                    var data = new List<RatingEntry>();

//                    // Create RatingEntry instances based on user data and blog posts
//                    foreach (var userMedicalCard in userData)
//                    {
//                        foreach (var blogPost in blogData)
//                        {
//                            data.Add(new RatingEntry()
//                            {
//                                UserId = (uint)userId,
//                                DentalServiceId = (uint)userMedicalCard.DentalServiceId,
//                                BlogId = (uint)blogPost.BlogId,
//                                Label = 1 // You might want to adjust this based on your specific logic
//                            });
//                        }
//                    }

//                    var traindata = mlContext.Data.LoadFromEnumerable(data);

//                    MatrixFactorizationTrainer.Options options = new MatrixFactorizationTrainer.Options()
//                    {
//                        MatrixColumnIndexColumnName = nameof(RatingEntry.UserId),
//                        MatrixRowIndexColumnName = nameof(RatingEntry.DentalServiceId),
//                        LabelColumnName = "Label",
//                        LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass,
//                        Alpha = 0.01,
//                        Lambda = 0.025,
//                        NumberOfIterations = 100,
//                        C = 0.00001
//                    };

//                    var est = mlContext.Recommendation().Trainers.MatrixFactorization(options);

//                    modeltr = est.Fit(traindata);
//                }
//            }

//            var allBlogPosts = _context.BlogPosts;
//            var predictionResult = new List<Tuple<BlogPost, float>>();

//            foreach (var blogPost in allBlogPosts)
//            {
//                var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingEntry, BlogPostPrediction>(modeltr);
//                var prediction = predictionEngine.Predict(new RatingEntry()
//                {
//                    UserId = (uint)userId,
//                    DentalServiceId = (uint)userId, // Adjust this based on your actual data model
//                    BlogId = (uint)blogPost.BlogId
//                });

//                predictionResult.Add(new Tuple<BlogPost, float>(blogPost, prediction.Score));
//            }

//            var finalResult = predictionResult.OrderByDescending(x => x.Item2).Select(x => x.Item1).Take(3).ToList();

//            if (finalResult != null)
//                return _mapper.Map<List<BlogPostModel>>(finalResult);

//            return null;
//        }

//        public class RatingEntry
//        {
//            [KeyType(count: 262111)]
//            public uint UserId { get; set; }

//            [KeyType(count: 262111)]
//            public uint DentalServiceId { get; set; }

//            [KeyType(count: 262111)]
//            public uint BlogId { get; set; }

//            public float Label { get; set; }
//        }

//        public class BlogPostPrediction
//        {
//            public float Score { get; set; }
//        }
//    }
//}
