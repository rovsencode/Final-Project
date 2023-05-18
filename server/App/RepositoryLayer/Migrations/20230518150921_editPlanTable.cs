using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editPlanTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Property",
                table: "PricingPlans");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(6799),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5353));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(2252),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(1016));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1605),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(380));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7215),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5834));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1088),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(9843));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(6802),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(4629));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(3043),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(893));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(2038),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9985));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(1556),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9562));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(6565),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(4624));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(2191),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(161));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(1677),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(9618));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 728, DateTimeKind.Utc).AddTicks(7041),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(4073));

            migrationBuilder.CreateTable(
                name: "Property",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PlanId = table.Column<int>(type: "int", nullable: false),
                    isDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    CreatedTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7732))
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Property", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Property_PricingPlans_PlanId",
                        column: x => x.PlanId,
                        principalTable: "PricingPlans",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Property_PlanId",
                table: "Property",
                column: "PlanId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Property");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5353),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(6799));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(1016),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(2252));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(380),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1605));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5834),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7215));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(9843),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1088));

            migrationBuilder.AddColumn<string>(
                name: "Property",
                table: "PricingPlans",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(4629),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(6802));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(893),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(3043));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9985),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(2038));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9562),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(1556));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(4624),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(6565));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(161),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(2191));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(9618),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(1677));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(4073),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 728, DateTimeKind.Utc).AddTicks(7041));
        }
    }
}
