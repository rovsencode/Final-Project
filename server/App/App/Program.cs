using Microsoft.EntityFrameworkCore;
using RepositoryLayer.Data;
using RepositoryLayer.Repostories.Interfaces;
using RepositoryLayer.Repostories;
using ServiceLayer.Mappings;
using ServiceLayer.Services.Interfaces;
using ServiceLayer.Services;
using DomainLayer.Entites;
using Microsoft.AspNetCore.Identity;

namespace App
{
    public class Program
    {
        public static void Main(string[] args)
        {
           var builder = WebApplication.CreateBuilder(args);
            var _config = builder.Configuration;

            // Add services to the container.
            builder.Services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer(_config.GetConnectionString("DefaultConnection"));
            });
            builder.Services.AddAutoMapper(typeof(MappingProfile));
            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddScoped<IContactService, ContactService>();
            builder.Services.AddScoped<IContactRepository, ContactRepository>();
            builder.Services.AddScoped<IFaqService, FaqService>();
            builder.Services.AddScoped<IFaqRepository, FaqRepository>();
            builder.Services.AddScoped<IPricingPlansService, PricingPlansService>();
            builder.Services.AddScoped<IPricingPlansRepository, PricingPlansRepository>();

            builder.Services.AddScoped<IMovieService, MovieService>();
            builder.Services.AddScoped<IMovieRepository, MovieRepository>();
            builder.Services.AddScoped<IActressService, ActressService>();
            builder.Services.AddScoped<IActressRepository, ActressRepository>();
            builder.Services.AddScoped<ISerieService, SerieService>();
            builder.Services.AddScoped<ISerieRepository, SerieRepository>();
            builder.Services.AddScoped<IGenreService, GenreService>();
            builder.Services.AddScoped<IGenreRepository, GenreRepository>();
            builder.Services.AddScoped<IQualityService, QualityService>();
            builder.Services.AddScoped<IQualityRepository, QualityRepository>();
            builder.Services.AddScoped<IFeatureService, FeatureService>();
            builder.Services.AddScoped<IFeatureRepository, FeatureRepository>();
            builder.Services.AddScoped<IPropertyService, PropertyService>();
            builder.Services.AddScoped<IPropertyRepository, PropertyRepository>();
            builder.Services.AddScoped<IAccountService, AccountService>();



            builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            builder.Services.AddIdentity<AppUser, IdentityRole>(options => options.SignIn.RequireConfirmedAccount = true)
                 .AddEntityFrameworkStores<AppDbContext>();

            builder.Services.AddCors(p => p.AddPolicy("corspolicy", build =>
            {
                build.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
            }));
         
         
            var app = builder.Build();
            app.UseCors("corspolicy");

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}